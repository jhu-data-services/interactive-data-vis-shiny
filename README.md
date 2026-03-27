# Interactive Data Visualization in R with Shiny
Are you interested in exploring and understanding your data? Would you like to communicate your R analysis in an easy to use, interactive way? Shiny is an R package that makes it simple to build and share web applications for the purpose of visualizing and communicating your data interactively. Join JHU Data Services for a workshop introducing the Shiny package in R for developing and sharing interactive data visualizations. In this two-part hands-on session, we’ll cover design concepts of interactive data visualizations and build a Shiny web app from scratch using a prepared dataset. Some prior experience in R is required.

## JHU Data Services   
Website: [dataservices.library.jhu.edu/](https://dataservices.library.jhu.edu/)   
Contact us: [dataservices@jhu.edu](mailto:dataservices@jhu.edu)   
JHU Data Services, part of the Johns Hopkins University Sheridan Libraries, helps the JHU community find, use, visualize, manage, and share data. We offer live webinars and self-paced online trainings on computational research and coding, GIS, data management, data visualization, and more. [See all of our training topics on our website.](https://dataservices.library.jhu.edu/training-workshops/)   

This repository contains materials for one of our live webinars open to JHU students, faculty, and staff. Please [contact us](mailto:dataservices@jhu.edu) with any questions.

[See our calendar to register for upcoming workshops.](https://dataservices.library.jhu.edu/training-workshops/calendar/)


## Pre-Class Instructions

To follow along during the workshop, please complete the following setup steps in advance of tomorrows workshop:

### Step 1: Software Setup

Make sure you have downloaded and installed the following:

- **R** – https://cran.r-project.org/
- **RStudio** – https://posit.co/download/rstudio-desktop/ (select the Download button next to "2: Install RStudio")

If it's been a while since you've used R or RStudio, no worries! Just check your version numbers and consider updating if you're several versions behind.

### Step 2: Install Packages

We'll be using three R packages in this workshop. Please install them before the workshop starts, as some can take a few minutes to download.

- **ggplot2** – create data visualizations in R 📊
- **palmerpenguins** – contains the dataset we'll be visualizing 🐧
- **RColorBrewer** – provides color-blind-friendly color palettes 🎨
- **shiny** – build interactive dashboards in R 💎
- **bslib** – configure the look and feel of our dashboards 🖼️

Not sure if you've already installed these? Run `library(package_name)` to check. If you get an error, install them by opening RStudio and running:

```r
install.packages("ggplot2")
install.packages("palmerpenguins")
install.packages("RColorBrewer")
install.packages("shiny")
install.packages("bslib")
```

### Other Computer Setup

You'll need to switch between presentation slides and RStudio during the workshop. We recommend either connecting a second monitor or placing two windows side by side on your screen.


## Description of Files
- PresentationMaterials: This folder contains PowerPoint slides and other presentation materials used in the workshop
- Resources: This folder contains cheatsheets to assist you during the workshop and links to external sources for you to continue your learning


## Post-Class Survey
If you have taken the live webinar for this class, please take this survey: [Interactive Data Visualization in R with Shiny Survey](https://bit.ly/shiny-r-vis-survey)


## License and Terms of Use
The presentation materials are licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/), attributable to [Data Services](https://dataservices.library.jhu.edu/), Johns Hopkins University. 

See LICENSE file for additional code licensing and re-use information.   

The images, external resources, and cheatsheets linked in this repository may have other licenses and terms of use.


## Citation
Please cite this material as:    
Johns Hopkins University Data Services. March 24th and 25th, 2026. Interactive Data Visualization in R with Shiny. https://github.com/jhu-data-services/interactive-data-vis-shiny
