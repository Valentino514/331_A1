object(sun).
object(mercury).
object(venus).
object(earth).
object(mars).
object(jupiter).
object(saturn).
object(uranus).
object(neptune).
object(pluto).
object(moon).
object(deimos).
object(phobos).
object(arche).
object(callisto).
object(europa).
object(io).
object(themisto).
object(atlas).
object(calypso).
object(helene).
object(desdemona).
object(titania).
object(despina).
object(galatea).
object(larissa).
object(thalassa).

mass(mercury, 0.33).
mass(venus, 4.87).
mass(earth, 5.98).
mass(mars, 0.64).
mass(jupiter, 1900).
mass(saturn, 569).
mass(uranus, 569).
mass(neptune, 86.8).
mass(pluto, 0.02).

orbits(mercury, sun).
orbits(venus, sun).
orbits(earth, sun).
orbits(mars, sun).
orbits(jupiter, sun).
orbits(saturn, sun).
orbits(uranus, sun).
orbits(neptune, sun).
orbits(pluto, sun).
orbits(moon, earth).
orbits(deimos, mars).
orbits(phobos, mars).
orbits(arche, jupiter).
orbits(callisto, jupiter).
orbits(europa, jupiter).
orbits(io, jupiter).
orbits(themisto, jupiter).
orbits(atlas, saturn).
orbits(calypso, saturn).
orbits(helene, saturn).
orbits(desdemona, uranus).
orbits(titania, uranus).
orbits(despina, neptune).
orbits(galatea, neptune).
orbits(larissa, neptune).
orbits(thalassa, neptune).

is_planet(X) :- mass(X,Mass), Mass > 0.33, orbits(X,sun).

% grounded queries
?-is_planet(pluto).
?-is_planet(mars).
?-is_planet(pluto).

% non-grounded queries
?- is_planet(P).
 P = mercury;
 P = venus;
 P = earth;
 P = mars;
 P = jupiter;
 P = saturn;
 P = uranus;
 P = neptune;

is_satellite_of(X, Y) :- orbits(X, Y), is_planet(Y).

% non-grounded queries

 ?is_satellite_of(S, mars).
  S = deimos;
  S = phobos;
  ?is_satellite_of(moon, Planet).
Planet = earth;

obtain_all_satellites(Object,List) :- is_planet(Object),
findall(S, orbits(S, Object) , List).

% non-grounded queries

?- obtain_all_satellites(earth, List).

?- obtain_all_satellites(mars, List).

?- obtain_all_satellites(venus, List).

?- obtain_all_satellites(saturn, List).

?- all_satellites_of(mars, List).

?- all_satellites_of(jupiter, List).

?- all_satellites_of(pluto, List). % pluto is not a planet









