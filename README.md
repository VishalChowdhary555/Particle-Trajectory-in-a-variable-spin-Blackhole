# README for Event Horizon Simulation

## Overview
The `event_horizon_simulation.m` script simulates the motion of a particle near a black hole, demonstrating the effects of gravity on the particle's trajectory based on the black hole's spin parameter. The simulation can represent both non-rotating and rotating black holes, depending on the value of the spin parameter \( a \).

## Key Features
- **Gravitational Model**: The simulation uses a simple gravitational model with a fixed gravitational constant (G) and mass (M) for the black hole.
- **Black Hole Spin**: The spin parameter \( a \) determines whether the black hole is rotating or non-rotating:
  - \( a = 0 \): Non-rotating Schwarzschild black hole.
  - \( a > 0 \): Rotating Kerr black hole (not fully implemented in this version, but the parameter is included for future enhancements).
- **Particle Motion**: The motion of the particle is described using a system of ordinary differential equations (ODEs) that account for gravitational effects.
- **3D Visualization**: The trajectory of the particle is plotted in a 3D coordinate system, using spherical coordinates to represent its position.

## Code Explanation

### Main Function: `event_horizon_simulation()`
- **Parameters**:
  - `G`: Gravitational constant, set to 1 for simplicity.
  - `M`: Mass of the black hole, also set to 1.
  - `a`: Spin parameter, which can be adjusted to model different types of black holes (0 for non-rotating, greater than 0 for rotating).
  - `r_min`: Minimum radius, set slightly above the event horizon (1.0001) to avoid singularity issues.
  
- **Initial Conditions**: 
  - The initial state of the particle is defined as `[r_min, pi/2, 0, 0, 1e1]`, where:
    - `r_min`: Initial radial distance from the black hole.
    - `theta`: Polar angle (pi/2 for starting at the equator).
    - `phi`: Azimuthal angle (0).
    - `v_r`: Initial radial velocity (0).
    - `v_theta`: Initial angular velocity (10).

- **Time Span**: The simulation runs from time 0 to 100, with 1000 time points.

- **ODE Solver**: The `ode45` function is used to solve the system of ODEs defined in the `event_horizon_equations` function.

- **3D Plotting**: The trajectory is plotted in 3D space using spherical coordinates, with axis labels and a title.

### Function: `event_horizon_equations(t, y, G, M, a)`
- **Inputs**:
  - `t`: Current time.
  - `y`: Current state vector containing position and velocity components.
  - `G`, `M`, `a`: Parameters for gravitational calculations.

- **Output**: 
  - `dydt`: A vector representing the derivatives of the state variables.

- **Equations of Motion**:
  - The function calculates the changes in the position and velocity of the particle based on gravitational effects.
  - The radial distance (`r`) is enforced to remain above a minimum value to avoid singularities.
  - The radial velocity (`v_r`) is updated based on the gravitational force.
  - The angular position (`theta` and `phi`) is updated, with a small oscillation added to `phi` for complexity.

## Usage
To run the simulation, ensure that you have MATLAB installed. Execute the `event_horizon_simulation()` function in the MATLAB command window. The simulation will generate a 3D plot of the particle's trajectory near the black hole.

## Requirements
- MATLAB with the ODE solver capabilities (such as `ode45`).

## Conclusion
This simulation provides a basic understanding of how particles behave under the influence of a black hole's gravity, accounting for both rotating and non-rotating scenarios. It can serve as a foundation for more complex simulations involving rotating black holes or other astrophysical phenomena. The inclusion of the spin parameter \( a \) allows for potential future enhancements to accurately model the dynamics of Kerr black holes.
