% ORAPASS(1) ORAPASS User Manual
% Tom Regan
% November 2019
# NAME
orapass \- Oracle Connection File Password Encryption/Decryption

# SYNOPSIS
**orapass** [encrypt|decrypt] TEXT KEY

# DESCRIPTION
**orapass** is a tool for encrypting and decrypting passwords stored in Oracle connection files.

Connection files are used by SQLDEVELOPER to export users' connections.

For **DECRYPTION** The CYPHERTEXT must be a base64 encoded string; for ENCRYPTION the **PLAINTEXT**
can be any character string; the KEY is the password which was used at the time the file was created.

The default mode is **decrypt**.

# EXAMPLES
Decrypt the cyphertext **mr1Ve8X3UXQ=** which was encrypted with the password **pass** 
```sh
orapass mr1Ve8X3UXQ= pass
```
Encrypt the plaintext **myPass2** with the password **pass**
```sh
orapass encrypt myPass2 pass
```



