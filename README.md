# RODI Relational-to-Ontology Mapping Quality Benchmark

RODI is a benchmark suite for testing the quality of (semi-)automatically generated, RDB2RDF (relational database to RDF) mappings.

For an overview and previous results, please see [1]. When referring to this work, please always cite as most current publication (currently [1]).

## Installation Requirements
RODI is implemented in Java and requires JRE 1.8 or later. To compile and run the workspace, a corresponding JDK is needed.
The project also relies on a number of publicly available JAR libraries that are not included with the distribution for licensing restrictions. Please refer to manual.pdf for a full list including download instructions for those libraries.

## Usage
RODI can be run as an Eclipse project, or from the command line using the latest release.
When starting from Eclipse, the Main type to execute is com.fluidops.rdb2rdfbench.Main.
Try --help for command line options.

For further usage documentation, please refer to the user's manual (manual.pdf) included with the release distribution.

## Related Publications
[1] C. Pinkel et al. _RODI: A Benchmark for Automatic Mapping Generation in Relational-to-Ontology Data Integration_. In: _ESWC_ 2015
[2] E. Jimenez et al. _BOOTOX: Practical Mapping of RDBs to OWL 2_. In: _ISWC_ 2015