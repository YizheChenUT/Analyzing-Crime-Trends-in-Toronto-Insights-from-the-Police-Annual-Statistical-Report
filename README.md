# Analyzing Crime Trends in Toronto: Insights from the Police Annual Statistical Report

## Overview

This paper analyzes crime trends in Toronto using the Police Annual Statistical Report from 2014 to 2023. Data from *Open Data Toronto* is used to evaluate crime distributions across different categories and regions.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from *Open Data Toronto*.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. The abstract and introduction were written with the help of ChatGPT and the entire chat history is available in `other/llm/usage.txt`.

## How to Run
1. Run `scripts/01-download_data.R` to download raw data
2. Run `scripts/02-data_cleaning.R` to get cleaned data
3. Run  `paper/paper.qmd` to generate the PDF of the paper
4. Run `scripts/00-simulate_data.R` to simulate data
5. Run `scripts/03-test_data.R` to test simulated data