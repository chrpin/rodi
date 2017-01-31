# RODI Relational-to-Ontology Mapping Quality Benchmark

RODI is a benchmark suite for testing the quality of (semi-)automatically generated, RDB2RDF (relational database to RDF) mappings.  

When referring to this work, please always cite our most recent publication (currently [<a href="#rodi1">1</a>]). For an overview of the first prototype, please see [<a href="#rodi2">2</a>]. 

## Requirements
RODI is implemented in Java and requires JRE 1.8 or later.

For developers, to compile and run the workspace, a corresponding JDK is needed. Eclipse is recommended for development and an Eclipse project is pre-configured. RODI also relies on a number of publicly available JAR libraries that are not included with in the repository (see below).

## Download and Installation
For use by non-developers, there is a complete pre-packaged distribution of the latest RODI release available from the [University of Oxford](http://www.cs.ox.ac.uk/isg/tools/RODI/). It runs directly from the command line.

Development requires a clone of this git repository. You may either use the pre-configured Eclipse project, in which case several external libraries need to be added manually. 
Please refer to [manual.pdf](https://github.com/chrpin/rodi/raw/master/manual.pdf) for a full list of required libraries including download instructions. As an alternative, you may use the included Maven to automatically download dependencies.
To generate a RODI JAR file from the command line using Maven, run: mvn package

## Usage
RODI can be run as an Eclipse project, or from the command line using the [latest release](http://www.cs.ox.ac.uk/isg/tools/RODI/).
When starting from Eclipse (or from a Maven-generated JAR), the Main type to execute is com.fluidops.rdb2rdfbench.Main.
Try --help for command line options.

For further usage documentation, please refer to the user's manual ([manual.pdf](https://github.com/chrpin/rodi/raw/master/manual.pdf)) included with the release distribution.

## Related Publications and Resources
<a name="rodi1">[1]</a>
Christoph Pinkel, Carsten Binnig, Ernesto Jimenez-Ruiz, Evgeny Kharlamov, Wolfgang May, Andriy Nikolov, Martin G. Skj&aelig;veland, Alessandro Solimando, Mohsen Taheriyan, Christian Heupel, Ian Horrocks
_RODI: Benchmarking Relational-to-Ontology Mapping Generation Quality_.  Semantic Web Journal. IOS Press. 2017 (in press). (<a href="http://www.semantic-web-journal.net/system/files/swj1439.pdf" target="_blank">[PDF]</a>)

[2] C. Pinkel et al. _RODI: A Benchmark for Automatic Mapping Generation in Relational-to-Ontology Data Integration_. In: _ESWC_ 2015. (<a href="http://www.cs.ox.ac.uk/files/7406/paperRDBRDFBench.pdf">PDF</a>)

[3] RODI Introductory Presentation at ESWC 2015 (<a href="http://videolectures.net/eswc2015_pinkel_data_integration/">videolectures.net</a>)

[4] E. Jimenez et al. _BOOTOX: Practical Mapping of RDBs to OWL 2_. In: _ISWC_ 2015. (<a href="http://www.cs.ox.ac.uk/files/7411/main-bootox-iswc-15.pdf">PDF</a>)
