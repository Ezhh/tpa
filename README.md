tpa 
===

Teleport by area number mod for Minetest.

Intended for use with and requires the "Areas" mod (https://github.com/ShadowNinja/areas).


tpa Command
-----------

"tpa" or,  more formally, Minetest "tpa" mod, is a mod,  or extension,
for Minetest 0.4.13 or above that adds "chat" commands in the format "/tpa <area number>", using "areas" mod area numbers. For example:

/tpa 10

This command will teleport the player to area #10. Any valid area number may be specified.

Required Privileges
-------------------

By default, to use "/tpa" commands, players need the "areas" and
"noclip" privileges.

If a server owner wishes to allow most players to use "/tpa", he or she
can add the following setting to "minetest.conf":

tpamode = lax

This setting allows anybody with the "shout" privilege to use "/tpa".

Alternatively, the following setting treats "/tpa" as a teleport capa-
bility and lets people with the "teleport" privilege use "/tpa":

tpamode = teleport

Note: Use of teleport or lax tpamodes lacks check for noclip priv and users may be trapped in solid nodes.

Installation
------------

To install "tpa", use the usual Minetest mod procedures. If you're in-
stalling  from a GitHub ZIP file, remember to rename the "tpa" direc-
tory from tpa-master or any similar name to just "tpa".

License
-------

The License for this mod is: WTFPL. This mod is by Shara RedCat and
shivajiva with kibitzing by OldCoder.
