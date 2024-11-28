function rotating_black_hole_simulation()
    % Parameters
    G = 1;       % Gravitational constant (set for simplicity)
    M = 1;       % Mass of the black hole (set for simplicity)
    a = 0.9;     % Spin parameter for a rotating black hole
    r_min = 1.0001; % Slightly above the event horizon to avoid singularity

    % Function for particle motion equations
    particle_motion = @(t, y) rotating_black_hole_equations(t, y, G, M, a);

    % Initial conditions (r, theta, phi, radial velocity, angular velocity)
    initial_conditions = [r_min, pi/2, 0, 0, 1e1]; % Adjusting initial radial velocity

    % Time span for simulation
    t_span = linspace(0, 100, 1000);

    % Solve the system of ODEs
    [t, y] = ode45(particle_motion, t_span, initial_conditions);

    % Plot the trajectory in 3D space using spherical coordinates
    figure;
    plot3(y(:, 1).*sin(y(:, 2)).*cos(y(:, 3)), y(:, 1).*sin(y(:, 2)).*sin(y(:, 3)), y(:, 1).*cos(y(:, 2)), 'LineWidth', 2);
    title('Particle Trajectory near a Rotating Black Hole with Event Horizon');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on;
    axis equal;
end

function dydt = rotating_black_hole_equations(t, y, G, M, a)
    r = y(1);
    theta = y(2);
    phi = y(3);
    v_r = y(4);
    v_theta = y(5);

    % Enforce a minimum radius to avoid singularity
    r = max(r, 1e-5);

    % Equations of motion with gravitational effects
    dydt = zeros(5, 1);
    dydt(1) = v_r;
    dydt(2) = v_theta / r;
    dydt(3) = 0.1 * sin(2 * t); % Adding a small angular motion for complexity
    dydt(4) = -G * M / r^2;
    dydt(5) = (2 * G * M * a / (r^3)) * sin(theta)^2; % Including the effects of rotation
end
