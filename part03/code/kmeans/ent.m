function y = ent(vec)
prob = vec / sum(vec);
log2(prob)
prob .* log2(prob)
y = -sum(prob .* log2(prob));
end

