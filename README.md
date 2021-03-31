# Simulating Removable Media with Git

## Why

In the Old Days of Unspecified Sentiment Polarity, you had
to put a floppy disk or CD-ROM in the disk drive to play a
game or access your files. Hard drive space was scarce and
generally reserved for system programs and other important
files.

This restriction forced one to be very intentional about
context-switching. You couldn't get distracted and lose
focus on what you were doing, because switching tasks
required physically ejecting the disk and inserting a new
one--a process that's basically impossible to do
thoughtlessly.

There is also the element of statefulness: what's in the
drive stays in the drive, across reboots. This means you're
more likely to stay on task across computing sessions (or
listen to the same album over and over again, if it's a
music CD in the CD drive). Modern computer systems, by
contrast, often force the user to make a conscious choice
about trivial things like what music to listen to (out of
the millions of available songs), which costs mental
resources [citation needed].

I find myself getting distracted so frequently these days
that I crave the arbitrary restrictions of more
physically-bound media.  However, my computer does not have
a removable media drive, and I don't relish the thought of
trying to actually fit data like music files onto floppy
disks.

## Implementation

The previous section talked a bit about the desired outcome;
one way to get there is using a Git repository where each
branch corresponds to a "virtual disk". Switching to a
branch is equivalent to putting a disk in the drive.

There are some nice isomorphisms between the removable-media
and Git-based situations:

- Only one disk can be in a drive at the time. Similarly,
  only one branch can be checked out in Git at a time (if you
  don't use worktrees)
- The checked-out branch persists across reboots.

## Tutorial

To create a new drive, run `create-drive /path/to/drive`.

If you plan to store large files, you will want to install
git-lfs via `brew install git-lfs` or the equivalent for
your platform. Then run `git lfs track "*.zip"` or whatever
to get git-lfs to track your large files.

## Drawbacks

You might think that putting all of this in Git makes it
easy to share data between computers by pushing to a remote,
or using a central point of coordination like Github. It's
not quite that simple. If changes are pushed from multiple
computers, you can get conflicts.
