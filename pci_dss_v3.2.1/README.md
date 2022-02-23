# PCI DSS 3.2.1

This CloudQuery policy implements the PCI DSS 3.2.1 benchmark guidelines.

## Overview

Full Guidelines are available [here](https://www.pcisecuritystandards.org/document_library?category=pcidss&document=pci_dss).

Quote from the guidelines:

>The Payment Card Industry Data Security Standard (PCI DSS) was developed to encourage and enhance cardholder data security and facilitate
the broad adoption of consistent data security measures globally. PCI DSS provides a baseline of technical and operational requirements
designed to protect account data. PCI DSS applies to all entities involved in payment card processing—including merchants, processors,
acquirers, issuers, and service providers. PCI DSS also applies to all other entities that store, process or transmit cardholder data (CHD) and/or
sensitive authentication data (SAD).

## Running

```
cloudquery policy run aws//pci_dss_v3.2.1
```