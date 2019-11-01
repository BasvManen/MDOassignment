function [f,vararg] = optimization(x)

[W_wing, W_fuel] = MDA(x);

f = objective(W_wing, W_fuel);
vararg = [W_wing, W_fuel];
end

