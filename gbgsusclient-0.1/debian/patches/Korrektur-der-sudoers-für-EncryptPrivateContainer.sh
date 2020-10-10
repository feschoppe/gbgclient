Description: <short summary of the patch>
 TODO: Put a short summary on the line above and replace this paragraph
 with a longer explanation of this change. Complete the meta-information
 with other relevant fields (see below for details). To make it easier, the
 information below has been extracted from the changelog. Adjust it or drop
 it.
 .
 gbgsusclient (0.1-4) focal; urgency=medium
 .
   * Initial release (Closes: #nnnn)  <nnnn is the bug number of your ITP>
Author: Felix Schoppe <felix.schoppe@gbg-seelze.eu>

---
The information above should follow the Patch Tagging Guidelines, please
checkout http://dep.debian.net/deps/dep3/ to learn about the format. Here
are templates for supplementary fields that you might want to add:

Origin: <vendor|upstream|other>, <url of original patch>
Bug: <url in upstream bugtracker>
Bug-Debian: https://bugs.debian.org/<bugnumber>
Bug-Ubuntu: https://launchpad.net/bugs/<bugnumber>
Forwarded: <no|not-needed|url proving that it has been forwarded>
Reviewed-By: <name and email of someone who approved the patch>
Last-Update: 2020-09-16

--- gbgsusclient-0.1.orig/sudoers.d/sudogbgclient
+++ gbgsusclient-0.1/sudoers.d/sudogbgclient
@@ -4,5 +4,6 @@ gbg ALL = NOPASSWD: /usr/bin/updater.sh
 gbg ALL = NOPASSWD: /usr/bin/nutzerdatenerfassung.sh
 #Container-Management
 gbg ALL = NOPASSWD: /usr/bin/CreatePrivateContainer.sh
+gbg ALL = NOPASSWD: /usr/bin/EncryptPrivateContainer.sh
 gbg ALL = NOPASSWD: /usr/bin/MountPrivateContainer.sh
 gbg ALL = NOPASSWD: /usr/bin/UMountPrivateContainer.sh
