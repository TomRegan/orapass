% ORAPASS(1) ORAPASS User Manual
% Tom Regan
% November 2019
# NAME
orapass \- Oracle Connection File Password Decryption

# SYNOPSIS
**orapass** CYPHERTEXT KEY

# DESCRIPTION
**orapass** is a tool for decrypting passwords stored in Oracle connection files.

Connection files are used by SQLDEVELOPER to export users' connections.

The CYPHERTEXT must be a base64 encoded string, and the KEY is the password which
was used at the time the file was created.

# EXAMPLES
Decrypt the cyphertext **mr1Ve8X3UXQ=** which was encrypted with the password **pass** 
```sh
orapass mr1Ve8X3UXQ= pass
```



