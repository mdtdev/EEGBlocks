# EEGBlocks

##Functions (Blocks) for EEG Data Processing Pipelines

A collection of functional blocks for building EEG processing pipelines. Much of it will be self-contained, but it may at time depend on several other systems:

* EEG (https://github.com/mdtdev/EEG)
* EEG\_Pipeline (https://github.com/mdtdev/EEG_Pipeline)
* eeglab (http://sccn.ucsd.edu/eeglab) and some of its plug-ins

Note that these blocks are built for working with the **Emotiv EPOC/EPOC+** systems, which have 14 electrodes and record at 128/256 Hz sampling frequency (at the first point of contact with the data) so these functions do not worry much about memory issues and therefore, while technically workable for larger data from systems with many electrodes or higher sampling rates, do not expect them to be good for such uses!

These blocks are intended to be sequential and have a common-I/O so that longer chains of data processing can be built into Matlab scripts. Not even semi-pure functional as these will likely depend on side-effects in Matlab, so you have been warned. :scream:

As always these are MIT Licensed (see license file) so attribution is needed, please do. Linking to the project and citing it by name are great. Letting us know you used and cited it is even better. It helps justify continuing the work!

2016.02.08
MDT
