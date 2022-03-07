package main

// This tool searches the ./test/snapshot-data directory looking for any AWS Account IDs
// Helping to ensure we don't leak any potentially sensitive information
// For the record AWS doesn't consider Account IDs to be sensitive but that is not a view that is universal

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

var ALLOWED_ACCOUNT_PREFIX = []string{
	"000000000000",
	"00000000",
	"0000",
}

func walkTestDir(directory string) ([]string, error) {
	var files []string

	err := filepath.Walk(directory, func(path string, info os.FileInfo, err error) error {
		files = append(files, path)
		return err
	})
	if err != nil {
		return []string{}, err
	}
	return files, nil
}

func validateMatches(matches []string, fileName string) ([]string, error) {
	validatedMatches := []string{}
	for i, match := range matches {
		accountAllowed := false
		for _, prefix := range ALLOWED_ACCOUNT_PREFIX {
			if strings.HasPrefix(match, prefix) {
				accountAllowed = true
			}
		}

		if !accountAllowed {
			validatedMatches = append(validatedMatches, fmt.Sprintf("%s found at index %d, in %s", match, i, fileName))
		}
	}
	return validatedMatches, nil
}

func checkFile(filePath string) ([]string, error) {
	// regex finds all 12 digit strings. This is a way of searching for AWS account IDs
	var re = regexp.MustCompile(`(?m)\d{12}`)
	dat, err := os.ReadFile(filePath)
	if err != nil {
		return []string{}, err
	}
	return validateMatches(re.FindAllString(string(dat), -1), filePath)

}

func main() {
	files, err := walkTestDir("./test/snapshot-data")
	if err != nil {
		log.Println(err)
		return
	}
	allMatches := []string{}
	for _, file := range files {
		matches, _ := checkFile(file)
		allMatches = append(allMatches, matches...)

	}
	for _, match := range allMatches {
		fmt.Println(match)
	}

	if len(allMatches) > 0 {
		log.Panicln("Found sensitive materials")
	}

}
