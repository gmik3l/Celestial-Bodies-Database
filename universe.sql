
CREATE DATABASE universe();


\c universe


CREATE TABLE galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    radius integer,
    mass integer
);


CREATE TABLE lifeform (
    name character varying(30) NOT NULL,
    lifeform_id integer NOT NULL,
    lifespan integer
);


CREATE TABLE moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    orbital_distance integer,
    has_life boolean
);


CREATE TABLE planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    description text,
    distance_from_star numeric(8,1),
    has_life boolean
);


CREATE TABLE star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_sol numeric(4,1),
    type character(1)
);



INSERT INTO galaxy VALUES (1, 'Milky Way', 14, 20, 133);
INSERT INTO galaxy VALUES (2, 'Republic', 7, 12, 53);
INSERT INTO pgalaxy VALUES (3, 'Andromeda', 12, 23, 443);
INSERT INTO galaxy VALUES (4, 'Garbok', 122, 2233, 4243);
INSERT INTO galaxy VALUES (5, 'Vibros', 2, 10, 33);
INSERT INTO galaxy VALUES (6, 'Misk', 123, 3, 2);


INSERT INTO lifeform VALUES ('Human', 1, 110);
INSERT INTO lifeform VALUES ('Thargoid', 2, NULL);
INSERT INTO plifeform VALUES ('Obelisks', 3, 2400);


INSERT INTO moon VALUES (1, 'Luna', 1, 'Rocks and dust make such a pretty nightlight.', 238900, false);
INSERT INTO moon VALUES (2, 'Phobos', 2, 'Fear.', 28900, false);
INSERT INTO moon VALUES (3, 'Deimos', 2, 'Panic.', 22900, false);
INSERT INTO moon VALUES (4, 'Centax-1', 3, 'Colonized.', 121231, true);
INSERT INTO moon VALUES (5, 'Centax-2', 3, 'Colonized.', 141231, true);
INSERT INTO moon VALUES (6, 'Centax-3', 3, 'Colonized.', 1478631, true);
INSERT INTO moon VALUES (7, 'Hesperidium', 3, 'A new home.', 8631, true);
INSERT INTO moon VALUES (8, 'LHS 20 A 1 A', 4, 'Rocky satellite.', 3631, true);
INSERT INTO moon VALUES (9, 'LHS 20 A 1 B', 4, 'Rocky satellite.', 7331, true);
INSERT INTO moon VALUES (10, 'LHS 20 A 1 C', 4, 'Icy satellite.', 73231, true);
INSERT INTO moon VALUES (11, 'LHS 20 A 2 A', 5, 'Icy satellite.', 7331, true);
INSERT INTO moon VALUES (12, 'LHS 20 A 2 B', 5, 'Rocky satellite.', 7392, true);
INSERT INTO moon VALUES (13, 'LHS 20 A 2 C', 5, 'Rocky satellite.', 73912, true);
INSERT INTO moon VALUES (14, 'LHS 20 A 2 D', 5, 'Rocky satellite. Barely in orbit.', 739172, true);
INSERT INTO moon VALUES (15, 'LHS 20 A 4 a', 5, 'Icy sattelite.', 772, true);
INSERT INTO moon VALUES (16, 'LHS 20 A 4 b', 5, 'Icy sattelite.', 7172, true);
INSERT INTO moon VALUES (17, 'LHS 20 A 4 c', 5, 'Icy sattelite.', 71712, true);
INSERT INTO moon VALUES (18, 'Franklins Inheritance', 7, 'Rodriga Franklin, Daughter of Geraldine, owns this now.', 73612, true);
INSERT INTO moon VALUES (19, 'Otomatone', 10, 'Moon music lulled us to sleep.', 7312, true);
INSERT INTO moon VALUES (20, 'Okidokie', 11, 'With eyes on her, all was well.', 735852, true);


INSERT INTO planet VALUES (1, 'Earth', 1, 'Only habitable Sol planet. Home to humanity.', 499.0, true);
INSERT INTO planet VALUES (2, 'Mars', 1, 'Rocky red soil. Terraformable. Closest planet to Earth.', 760.2, false);
INSERT INTO planet VALUES (3, 'Coruscant', 2, 'Panopolis. Seat of the Galactic Senate. Home to the Jedi Temple.', 523.2, true);
INSERT INTO planet VALUES (4, 'LHS 20 A 1', 3, 'Small rocky body. No native life, but humans have settled it.', 220.2, true);
INSERT INTO planet VALUES (5, 'LHS 20 A 3', 3, 'Large icy body with rings. Lucrative mining operations.', 1232.2, false);
INSERT INTO planet VALUES (6, 'LHS 20 A 4', 3, 'Large gas giant. No sign of life.', 4332.2, false);
INSERT INTO planet VALUES (7, 'Franklins Keep', 4, 'Geraldine Franklin colonized this body in 3023.', 332.2, true);
INSERT INTO planet VALUES (8, 'Sigint', 4, 'Site of the battle of ecclesiastes. No current residents.', 642.2, false);
INSERT INTO planet VALUES (9, 'Barre', 4, 'Old rebel bases all over the place. Half the surface was glassed.', 1642.2, false);
INSERT INTO planet VALUES (10, 'Omicron', 5, 'No longer traveled. Dangerous. Void creatures.', 12.2, true);
INSERT INTO planet VALUES (11, 'Omega', 5, 'No longer traveled. Dangerous. Void creatures.', 1332.2, true);
INSERT INTO planet VALUES (12, 'Omigosh', 5, 'No longer traveled. Dangerous. Valley girls.', 133232.2, true);


INSERT INTO star VALUES (1, 'Sol', 1, 0.0, 'G');
INSERT INTO star VALUES (2, 'Coruscant', 2, 999.0, 'B');
INSERT INTO star VALUES (3, 'LHS 20', 1, 50.4, 'M');
INSERT INTO star VALUES (4, 'Franklins Rest', 3, 999.9, 'A');
INSERT INTO star VALUES (5, 'Oberon', 4, 999.9, 'O');
INSERT INTO star VALUES (6, 'Bisk', 6, 999.9, 'T');




ALTER TABLE lifeform ADD UNIQUE (name);
ALTER TABLE lifeform ADD PRIMARY KEY (lifeform_id);


ALTER TABLE moon ADD UNIQUE (name);
ALTER TABLE moon ADD PRIMARY KEY (moon_id);


ALTER TABLE planet ADD UNIQUE (name);
ALTER TABLE planet ADD PRIMARY KEY (planet_id);


ALTER TABLE star ADD UNIQUE (name);
ALTER TABLE star ADD PRIMARY KEY (star_id);


ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

ALTER TABLE planet ADD OREIGN KEY (star_id) REFERENCES star(star_id);

ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
