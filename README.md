# AWS Security & Compliance CloudQuery policy pack

Official AWS security &amp; compliance policy pack for CloudQuery.

## Included Policies

- CIS v1.2.0
- PCI DSS v.3.2.1

## Quick Start

### Prerequisite

1. [Install CloudQuery](https://docs.cloudquery.io/docs/getting-started)
2. [Install AWS Provider](https://docs.cloudquery.io/docs/cli/fetch/overview)
3. [Fetch](https://hub.cloudquery.io/providers/cloudquery/aws/latest)

### Running

```bash
# Run the whole pack
cloudquery policy run aws

# Run specific policy
cloudquery policy run aws --sub-path cis_v1.2.0

# Run specific check
cloudquery policy run aws --sub-path cis_v1.2.0/1/1
```