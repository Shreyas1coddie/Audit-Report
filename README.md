## Audit-Report-Git:

## About the Project:
This project is part of my Open Source Software coursework, with the focus on understanding Git beyond the mere use of the various commands.

I chose to explore the following aspects of Git instead of the mere use of the version control system:

- The reason behind the creation of Git  
- The values represented by the system  
- The internal workings within the Linux system  
- The comparison with proprietary software  
In addition to the theory, I also wrote 5 shell scripts to relate the concepts with the real world.

##  Why Git?
Git was first developed in 2005 by Linus Torvalds due to the fact that a proprietary system (BitKeeper) that he had been using was no longer available. What started off as a quick fix has since grown to become the very heart of software development itself.
Today, virtually every large software development project, whether open-source or corporate, uses Git in some way.

## What This Project Covers:

###  Origin & Philosophy
- The BitKeeper incident and the necessity for Git to emerge  
- The open-source culture and its role in software development  
###  GPL v2 License
- Freedom to use, change, and distribute  
- The copyleft principle: open-source code must always stay open-source  
###  Linux Integration
- Installation through package managers  
- Important directories: `.git/`, `/usr/bin/git/`, etc.  
###  FOSS Ecosystem
- Other software developed on top of Git: GitHub, GitLab, etc.  
- How Git enables open-source software development  
###  Open Source vs Proprietary
- Compared Git with Perforce, etc.  
- How open source compares with proprietary software

  ##  Shell Scripts:

 **Script 1** :Displays system information        
 **Script 2** : Checks Git installation & details  
 **Script 3** : Audits disk usage & permissions    
 **Script 4** : Analyzes log files                 
 **Script 5** : Generates an open-source manifesto

 ##  How to Run

```bash
chmod +x script*.sh
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_permission_auditor.sh
./script4_log_analyzer.sh /var/log/syslog error
./script5_manifesto_generator.sh

## Author:
 Shreyas Kurle
