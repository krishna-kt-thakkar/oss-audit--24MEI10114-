# oss-audit-[rollnumber]

**Open Source Software Audit — VITyarthi Capstone Project**

| Field | Details |
|---|---|
| Student Name | [Krishna Thakkar] |
| Registration Number | [24MEI10114] |
| Course | Open Source Software |
| Chosen Software | **Git** (GPL v2) |
| Submission Date | [31-03-2026] |

---

## About This Project

This repository contains all deliverables for the Open Source Audit capstone project.
The audit examines **Git** — a distributed version control system originally written by
Linus Torvalds in 2005. The project covers Git's origin story, its GPL v2 license,
its Linux footprint, its FOSS ecosystem, and a comparison with proprietary alternatives.

---

## Repository Contents

```
oss-audit-[rollnumber]/
├── README.md                            ← This file
├── scripts/
│   ├── script1_system_identity.sh       ← Script 1: System Identity Report
│   ├── script2_package_inspector.sh     ← Script 2: FOSS Package Inspector
│   ├── script3_disk_permission_auditor.sh ← Script 3: Disk and Permission Auditor
│   ├── script4_log_analyzer.sh          ← Script 4: Log File Analyzer
│   └── script5_manifesto_generator.sh   ← Script 5: Open Source Manifesto Generator
└── report/
    └── OSS_Capstone_Report_Git.pdf      ← Project Report (also submitted on portal)
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `scripts/script1_system_identity.sh`

Displays a welcome screen showing Linux distribution name, kernel version, logged-in user,
home directory, system uptime, current date and time, and a message about the OS license.

**Shell concepts used:** Variables, `echo`, command substitution (`$()`), output formatting.

---

### Script 2 — FOSS Package Inspector
**File:** `scripts/script2_package_inspector.sh`

Checks whether `git` is installed on the system, retrieves its version and license
information, and uses a `case` statement to print a philosophy note about the chosen
package and several other FOSS packages.

**Shell concepts used:** `if-then-else`, `case` statement, `dpkg` / `rpm`, `grep`, pipes.

---

### Script 3 — Disk and Permission Auditor
**File:** `scripts/script3_disk_permission_auditor.sh`

Loops through a list of important system directories (`/etc`, `/var/log`, `/home`,
`/usr/bin`, `/tmp`, etc.) and reports the permissions, owner, group, and disk usage
of each. Also audits Git's configuration directories specifically.

**Shell concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer
**File:** `scripts/script4_log_analyzer.sh`

Reads a log file line by line, counts how many lines contain a specified keyword
(default: `error`), and prints the last 5 matching lines. Includes a retry loop
if the file is not found and handles empty files gracefully.

**Shell concepts used:** `while read` loop, `if-then`, counter variables, command-line
arguments (`$1`, `$2`), `until` loop for retry logic, `grep`, `tail`.

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/auth.log warning
```

---

### Script 5 — Open Source Manifesto Generator
**File:** `scripts/script5_manifesto_generator.sh`

Asks the user three interactive questions about their relationship with open-source
software, then composes a personalised philosophy manifesto paragraph and saves it
to a `.txt` file named after the current user.

**Shell concepts used:** `read` for interactive input, string concatenation,
writing to files with `>` and `>>`, `date` command, aliases concept (demonstrated via comments).

---

## How to Run the Scripts on Linux

### Prerequisites

- A Linux system (Ubuntu, Debian, Fedora, CentOS, or any standard distribution)
- Bash shell (version 4.0 or later — check with `bash --version`)
- Git installed (for Script 2 to show full output): `sudo apt install git`

### Setup — Make Scripts Executable

After cloning this repository, make all scripts executable:

```bash
git clone https://github.com/[your-github-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]/scripts
chmod +x *.sh
```

### Running Each Script

**Script 1 — System Identity Report:**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector:**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor:**
```bash
./script3_disk_permission_auditor.sh
```
> Note: Some directories may show `permission denied` for size — this is normal.
> Run with `sudo` for complete output: `sudo ./script3_disk_permission_auditor.sh`

**Script 4 — Log File Analyzer:**
```bash
# Basic usage with default keyword 'error'
./script4_log_analyzer.sh /var/log/syslog

# With a custom keyword
./script4_log_analyzer.sh /var/log/syslog warning

# If /var/log/syslog doesn't exist, try:
./script4_log_analyzer.sh /var/log/kern.log error
```

**Script 5 — Open Source Manifesto Generator:**
```bash
./script5_manifesto_generator.sh
```
> This script is interactive — it will ask you three questions.
> Your manifesto will be saved to `manifesto_[yourusername].txt` in the current directory.

---

## Dependencies

| Script | Dependency | How to Install |
|---|---|---|
| Script 1 | `lsb_release` | `sudo apt install lsb-release` |
| Script 2 | `dpkg` (Debian/Ubuntu) or `rpm` (CentOS/Fedora) | Pre-installed on respective distros |
| Script 2 | `git` | `sudo apt install git` |
| Script 3 | `du`, `ls`, `awk` | Pre-installed on all Linux systems |
| Script 4 | `grep`, `tail` | Pre-installed on all Linux systems |
| Script 5 | `date`, `cat` | Pre-installed on all Linux systems |

All dependencies are standard Linux tools. No third-party installations are required beyond a basic Linux system.

---

## Chosen Software: Git

**Category:** Version Control
**License:** GNU General Public License v2 (GPL v2)
**Original Author:** Linus Torvalds
**First Released:** April 2005
**Current Maintainer:** Junio C Hamano
**Official Website:** https://git-scm.com
**Source Repository:** https://github.com/git/git

Git was chosen for this audit because its origin story is directly tied to the core values of the open-source movement. It was created because proprietary tooling failed its creator, and it was released under a strong copyleft licence to ensure that what happened to the Linux community with BitKeeper could never happen again with Git.

---

*VITyarthi | Open Source Software Course | Capstone Project*
