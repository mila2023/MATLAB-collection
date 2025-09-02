# Parameter Estimation
Final Report on Tasks — a concise summary of the project objectives, methods applied, and key conclusions.

## Output
[Trajectory plot](figure.jpg)

## Overview
This project focuses on estimating the parameters of a physical model describing the motion of three identical masses interacting under gravity.  
The trajectories are modeled with a system of second-order linear ordinary differential equations.

## Data
- Measurement results are provided in `data_57`.  
- Additional reference coordinates are stored in `query_57`.  

## Evaluation
A MATLAB function (`test_solution_57`) is used to assess solution accuracy.  
A solution is considered satisfactory if the accuracy indicator (delta) is below `6 × 10⁻³`.

## Notes
This is an educational task demonstrating parameter estimation and accuracy evaluation in numerical modeling.
