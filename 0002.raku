# line noise? nah, just Raku stuff
# start with 1, 1
# the next element is * + *, sum of previous two (seems Raku was made for this problem)
# then take lazily until an element exceeds 4 million
# result is a sequence
my $fibs = (1, 1, (* + *) ...^ (* > 4_000_000));

# same trick as problem #1, use %% with grep
my &even = * %% 2;
say $fibs.grep(&even).sum;
