# SaltStack Module: Install and Manage linuxpatch.com Agent and Service

## Description

This SaltStack state module automates the process of downloading, executing, and cleaning up an installation script from [linuxpatch.com](https://linuxpatch.com). Additionally, it ensures that the `linuxpatch-agent` service is running and enabled at startup. The script is only executed if the file `/opt/linuxpatch/bin/linuxpatch` does not exist.

## Prerequisites

- SaltStack installed on the master and minion nodes.
- Properly configured pillar file with the API key for [linuxpatch.com](https://linuxpatch.com).

## Pillar Configuration

Create a pillar file (e.g., `linuxpatch.sls`) with the following content:

```yaml
linuxpatch:
  api_key: 'your_api_key_here'  # Replace with your actual API key
```
