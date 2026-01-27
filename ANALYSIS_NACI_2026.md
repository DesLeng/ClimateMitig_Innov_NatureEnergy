# Codebase Analysis: Climate Mitigation & Innovation NACI 2026

## Overview

This codebase is a comprehensive analytical framework built in **Stata** to study global trends in **Climate Change Mitigation Technologies (CCMT)** and **Adaptation Technologies**.

The main objective is to provide empirical data and analysis for the **South Africa National Advisory Committee on Innovation (NACI) 2026 report**, specifically for the chapter on "Sustainability and Climate Change Innovation".

## Core Functionality

The project performs the following:

1. **Patent Selection**: Filters global patent data using CPC (Cooperative Patent Classification) codes, specifically focusing on `Y02` (Mitigation) and `Y02A` (Adaptation).
2. **Trend Analysis**: Calculates innovation trends from **1995 to 2025**.
3. **Geographic Benchmarking**: Compares innovation patterns between **BRICS** countries (Brazil, Russia, India, China, South Africa) and the "Rest of the World" (RoW).
4. **Technology Deep-Dives**: Provides detailed modules for specific technologies such as **Electric Vehicles (EV)** and **Hydrogen (H2)**.
5. **Multidimensional Diffusion**: Analyzes how these technologies spread globally through:
    * **Patent Transfers** (International protection).
    * **Foreign Direct Investment (FDI)** (using Zephyr data).
    * **Public R&D Spending** (using IEA data).

## Technical Architecture

The codebase is organized into several key directories:

| Directory | Description |
| :--- | :--- |
| `CODE/Data_building/` | Scripts to clean, filter, and prepare raw databases (PATSTAT, Zephyr, IEA) for analysis. |
| `CODE/Analysis/` | Original analysis scripts (aligned with the Nature Energy 2019/2021 papers). |
| `CODE/Analysis 2026/` | Updated analysis modules for the NACI 2026 report, focusing on BRICS, EVs, and Hydrogen. |
| `CODE/Master_General.do` | The main entry point that orchestrates the data building and analysis workflow. |

## How to Run

To execute the analysis, follow these steps:

1. **Requirement**: Install **Stata** (version 16+ recommended).
2. **Configuration**: Open `CODE/Master_General.do` and update the `global` path definitions (lines 15-28) to point to your local data directories:
    * `$patstpath`: Path to your PATSTAT (EPO) `.dta` files.
    * `$zephyrpath`: Path to your Zephyr (Bureau van Dijk) FDI data.
    * `$otherpath`: Path to country-level variables (GDP, CO2, etc.).
3. **Execution Sequence**:
    * Run the scripts in `CODE/Data_building/` first to generate processed datasets.
    * Run the scripts in `CODE/Analysis 2026/` for the latest report outputs.

## Requirements & Dependencies

This project relies on several high-value, proprietary datasets that are **not** included in the repository:

### 1. Datasets

* **PATSTAT (European Patent Office)**: The primary source for global patent data.
* **ZEPHYR (Bureau van Dijk)**: Used for Foreign Direct Investment (FDI) data.
* **IEA Energy R&D Statistics**: For public research and development spending.
* **World Bank/IMF**: For auxiliary country-level data (GDP, Population, Emissions).

### 2. Environment Variables (Stata Globals)

You must define the following Stata globals in your environment or at the top of your master script:

* `compupath`: Root directory for all data.
* `dopath`: Path to the `.do` files in this repo.
* `datapath`: Target directory for processed mitigation patent databases.
* `patstpath`: Source directory for raw PATSTAT data.
