Sociability increases survival of adult female giraffes

Bond, Monica, University of Zurich, https://orcid.org/0000-0001-8500-6564
Lee, Derek, Pennsylvania State University
Farine, Damien, University of Zurich
Ozgul, Arpat, University of Zurich
Koenig, Barbara, University of Zurich
monica.bond@ieu.uzh.ch, derek@wildnatureinstitute.org, dfarine@ab.mpg.de, arpat.ozgul@ieu.uzh.ch, barbara.koenig@ieu.uzh.ch

Citation
Bond, Monica et al. (2021), Sociability increases survival of adult female giraffes, Dryad, Dataset, https://doi.org/10.5061/dryad.r4xgxd2bf

This archive contains the following files:

(1) Giraffe_Community_Covariates

(2) Giraffe_Survival 


Methodologial Information

Individual giraffe data were collected over 5 years (Jan 2012- Oct 2016) in the Tarangire Ecosystem of northern Tanzania using photographic capture-resight techniques. Surveys were conducted 6 times per year using a robust design. All tracks were driven once per survey. Individuals were identified using Wild-ID pattern recognition software. Social network analysis was used to calculate individual social metrics edge weight, gregariousness, and betweenness, and to detect social communities. The dataset Giraffe_Community_Covariates contains data on community-level values for environmental covariates for input into a design matrix in Program MARK. The dataset Giraffe_Survival is an encounter history for 512 individual adult female giraffes and social and non-social covariates structured as an input file for Program MARK.

*Note* Open Giraffe_Survival as a text file. For input into Program MARK, convert to an .INP file using methodology outlined in Cooch EG, White GC. 2019 Program MARK: A gentle introduction. 19th edition.


Data-Specific Information

(1) Giraffe_Community_Covariates

COMM = female social community, 1 - 10
BOMA = mean distance (km) from edge of community home range to the nearest boma
TOWN = mean distance (km) from edge of community home range to the nearest town
VOLC = proportion of community home range with volcanic soils
BUSH = proportion of community home range with dense bushlands
DENS = population density of all adult females (regardless of community membership) ever detected in the community home range

(2) Giraffe_Survival

ID = unique giraffe ID
EH = encounter history for 30 independent surveys (Jan 2012 to Oct 2016). 0 is not detected on a survey, 1 is detected.
1 - 10 columns = social community membership
EW = mean non-zero edge weight
MAXEW = maximum edge weight with any associate
GREG = mean group size (of other adult females)
BETW = betweenness
BOMA = average distance (km) of all locations to the nearest boma
TOWN = average distance (km) of all locations to the nearest town
BUSH = proportion of time spent in dense bushlands
VOLC = proportion of time spent in volcanic soils
ADREP = proportion of time spent in Acacia (Vachelia) drepanolobium
ATORT = proportion of time spent in Acacia (Vachelia) tortilis
DICHRO = proportion of time spent in Dichrostachys cinerea
GREGxBOMA = interactive effect of gregariousness and distance to boma
GREGxTOWN = interactive effect of gregariousness and distance to town
GREGxADREP = interactive effect of gregariousness and time spent in A. drepanolobium
BTWxBOMA = interactive effect of betweenness and distance to boma
BTWxTOWN = interactive effect of betweenness and distance to town
BTWxADREP = interactive effect of betweenness and time spent in A. drepanolobium
ADREPxBOMA = interactive effect of time spent in A. drepanolobium and distance to boma





