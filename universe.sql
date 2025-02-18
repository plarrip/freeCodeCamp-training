--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cosmos_join; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cosmos_join (
    moon_name character varying(30) NOT NULL,
    planet_name character varying(30),
    star_name character varying(30),
    galaxy_name character varying(30),
    cosmos_join_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.cosmos_join OWNER TO freecodecamp;

--
-- Name: cosmos_join_cosmos_join_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cosmos_join_cosmos_join_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cosmos_join_cosmos_join_id_seq OWNER TO freecodecamp;

--
-- Name: cosmos_join_cosmos_join_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cosmos_join_cosmos_join_id_seq OWNED BY public.cosmos_join.cosmos_join_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_stars integer,
    num_planets integer,
    num_moons integer,
    sq_lightyears numeric(7,2),
    expanding boolean,
    shrinking boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_sieblings integer,
    num_craters integer,
    sq_kms numeric(7,2),
    from_planet boolean,
    moon_ring boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_stars integer,
    num_moons integer,
    sq_kms numeric(7,2),
    gas_giant boolean,
    terrestrial boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_planets integer,
    num_moons integer,
    sq_kms numeric(7,2),
    igniting boolean,
    dying boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cosmos_join cosmos_join_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmos_join ALTER COLUMN cosmos_join_id SET DEFAULT nextval('public.cosmos_join_cosmos_join_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cosmos_join; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cosmos_join VALUES ('Europa', 'Earth', 'Sun', 'Milky Way', 1, NULL);
INSERT INTO public.cosmos_join VALUES ('Ganymede', 'Mars', 'Sun', 'Milky Way', 2, NULL);
INSERT INTO public.cosmos_join VALUES ('Titan', 'Jupiter', 'Betelgeuse', 'Andromeda', 3, NULL);
INSERT INTO public.cosmos_join VALUES ('Callisto', 'Saturn', 'Betelgeuse', 'Andromeda', 4, NULL);
INSERT INTO public.cosmos_join VALUES ('Io', 'Venus', 'Proxima Centauri', 'Triangulum', 5, NULL);
INSERT INTO public.cosmos_join VALUES ('Enceladus', 'Mercury', 'Proxima Centauri', 'Triangulum', 6, NULL);
INSERT INTO public.cosmos_join VALUES ('Triton', 'Neptune', 'Vega', 'Messier 87', 7, NULL);
INSERT INTO public.cosmos_join VALUES ('Phobos', 'Uranus', 'Vega', 'Messier 87', 8, NULL);
INSERT INTO public.cosmos_join VALUES ('Deimos', 'HD 189733b', 'Zeta Puppis', 'Large Magellanic Cloud', 9, NULL);
INSERT INTO public.cosmos_join VALUES ('Charon', 'Uranus', 'Vega', 'Messier 87', 10, NULL);
INSERT INTO public.cosmos_join VALUES ('Oberon', 'Proxima b', 'UY Scuti', 'Whirlpool Galaxy', 11, NULL);
INSERT INTO public.cosmos_join VALUES ('Ariel', 'Gliese 581g', 'Zeta Puppis', 'Large Magellanic Cloud', 12, NULL);
INSERT INTO public.cosmos_join VALUES ('Umbriel', 'Neptune', 'Vega', 'Messier 87', 13, NULL);
INSERT INTO public.cosmos_join VALUES ('Miranda', 'Kepler-22b', 'UY Scuti', 'Whirlpool Galaxy', 14, NULL);
INSERT INTO public.cosmos_join VALUES ('Dione', 'Kepler-22b', 'UY Scuti', 'Whirlpool Galaxy', 15, NULL);
INSERT INTO public.cosmos_join VALUES ('Rhea', 'Mercury', 'Proxima Centauri', 'Triangulum', 16, NULL);
INSERT INTO public.cosmos_join VALUES ('Iapetus', 'Gliese 581g', 'Zeta Puppis', 'Large Magellanic Cloud', 17, NULL);
INSERT INTO public.cosmos_join VALUES ('Mimas', 'Proxima b', 'UY Scuti', 'Whirlpool Galaxy', 18, NULL);
INSERT INTO public.cosmos_join VALUES ('Hyperion', 'Venus', 'Proxima Centauri', 'Triangulum', 19, NULL);
INSERT INTO public.cosmos_join VALUES ('Nereid', 'HD 189733b', 'Zeta Puppis', 'Large Magellanic Cloud', 20, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 1000, 5000, 100.00, true, false, 'Our home galaxy, a barred spiral with billions of stars.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000, 10000, 50000, 220.00, false, true, 'Closest spiral galaxy, on a collision course with the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, 2000, 8000, 60.00, true, false, 'A small spiral galaxy, part of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 1000000, 50000, 200000, 980.00, true, false, 'A massive elliptical galaxy, home to a supermassive black hole.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 100000, 1000, 4000, 60.00, true, false, 'A famous spiral galaxy with a smaller interacting companion.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 30000, 1500, 6000, 14.00, true, false, 'A satellite galaxy of the Milky Way, visible to the naked eye.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Europa', 3, 1200, 3.12, false, false, 'An icy moon with a potential subsurface ocean.', 25);
INSERT INTO public.moon VALUES (42, 'Ganymede', 3, 4000, 5.27, false, false, 'Largest moon in the Solar System, larger than Mercury.', 26);
INSERT INTO public.moon VALUES (43, 'Titan', 1, 2500, 8.12, false, false, 'Only moon with a thick atmosphere, has lakes of methane.', 27);
INSERT INTO public.moon VALUES (44, 'Callisto', 3, 10000, 7.29, false, false, 'One of the most cratered objects in the Solar System.', 28);
INSERT INTO public.moon VALUES (45, 'Io', 3, 400, 4.22, false, false, 'Most volcanically active body in the Solar System.', 29);
INSERT INTO public.moon VALUES (46, 'Enceladus', 1, 1000, 0.50, false, false, 'Has geysers that shoot water into space.', 30);
INSERT INTO public.moon VALUES (47, 'Triton', 0, 700, 2.16, false, false, 'Neptune’s largest moon, orbits in the opposite direction.', 31);
INSERT INTO public.moon VALUES (48, 'Phobos', 1, 20, 0.01, true, false, 'Small, irregularly shaped moon of Mars.', 32);
INSERT INTO public.moon VALUES (49, 'Deimos', 1, 10, 0.00, true, false, 'Smaller of the two Martian moons, very low gravity.', 36);
INSERT INTO public.moon VALUES (50, 'Charon', 0, 500, 1.15, false, false, 'Largest of Pluto’s moons, almost a binary planet.', 32);
INSERT INTO public.moon VALUES (51, 'Oberon', 4, 300, 3.00, false, false, 'Second-largest moon of Uranus, heavily cratered.', 33);
INSERT INTO public.moon VALUES (52, 'Ariel', 4, 200, 1.58, false, false, 'Uranian moon with signs of past geological activity.', 35);
INSERT INTO public.moon VALUES (53, 'Umbriel', 4, 150, 1.17, false, false, 'Darkest moon of Uranus, covered in craters.', 31);
INSERT INTO public.moon VALUES (54, 'Miranda', 4, 50, 0.47, false, false, 'Uranian moon with huge cliffs and deformations.', 34);
INSERT INTO public.moon VALUES (55, 'Dione', 1, 800, 1.12, false, false, 'Saturnian moon with bright ice cliffs.', 34);
INSERT INTO public.moon VALUES (56, 'Rhea', 1, 1500, 1.53, false, false, 'Second-largest moon of Saturn, has a thin atmosphere.', 30);
INSERT INTO public.moon VALUES (57, 'Iapetus', 1, 1600, 1.47, false, false, 'Saturnian moon with a two-tone coloration.', 35);
INSERT INTO public.moon VALUES (58, 'Mimas', 1, 400, 0.39, false, false, 'Saturn’s moon with a huge impact crater, looks like the Death Star.', 33);
INSERT INTO public.moon VALUES (59, 'Hyperion', 1, 200, 0.56, false, false, 'Saturnian moon with a sponge-like appearance.', 29);
INSERT INTO public.moon VALUES (60, 'Nereid', 0, 50, 0.34, false, false, 'One of Neptune’s outer moons with a highly eccentric orbit.', 36);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Earth', 1, 1, 510.10, false, true, 'Our home planet, the only known place with life.', 1);
INSERT INTO public.planet VALUES (26, 'Mars', 1, 2, 144.80, false, true, 'The red planet, with the tallest volcano in the solar system.', 1);
INSERT INTO public.planet VALUES (27, 'Jupiter', 1, 95, 61420.00, true, false, 'The largest planet, famous for its Great Red Spot.', 2);
INSERT INTO public.planet VALUES (28, 'Saturn', 1, 146, 42700.00, true, false, 'The ringed gas giant with the most moons.', 2);
INSERT INTO public.planet VALUES (29, 'Venus', 1, 0, 460.20, false, true, 'Hottest planet, with a thick toxic atmosphere.', 3);
INSERT INTO public.planet VALUES (30, 'Mercury', 1, 0, 74.80, false, true, 'The smallest planet, closest to the Sun.', 3);
INSERT INTO public.planet VALUES (31, 'Neptune', 1, 14, 7618.00, true, false, 'An ice giant with supersonic winds.', 4);
INSERT INTO public.planet VALUES (32, 'Uranus', 1, 27, 8083.00, true, false, 'A sideways-rotating ice giant with faint rings.', 4);
INSERT INTO public.planet VALUES (33, 'Proxima b', 1, 0, 750.00, false, true, 'An exoplanet in the habitable zone of Proxima Centauri.', 5);
INSERT INTO public.planet VALUES (34, 'Kepler-22b', 1, 0, 12000.00, false, true, 'A potential ocean world in the habitable zone.', 5);
INSERT INTO public.planet VALUES (35, 'Gliese 581g', 1, 0, 1800.00, false, true, 'A candidate exoplanet possibly supporting liquid water.', 6);
INSERT INTO public.planet VALUES (36, 'HD 189733b', 1, 0, 95000.00, true, false, 'A gas giant with glass rain and extreme winds.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 214, 608.00, false, false, 'The center of our solar system, a G-type main-sequence star.', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 0, 0, 1200.00, false, true, 'A red supergiant in Orion, expected to explode as a supernova.', 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 0, 0.14, false, false, 'The closest known exoplanet-hosting star to Earth.', 3);
INSERT INTO public.star VALUES (4, 'Vega', 1, 0, 2.30, false, false, 'A bright, fast-rotating A-type star in the Lyra constellation.', 4);
INSERT INTO public.star VALUES (5, 'UY Scuti', 0, 0, 1700.00, false, true, 'One of the largest known stars, a red supergiant near the Milky Way center.', 5);
INSERT INTO public.star VALUES (6, 'Zeta Puppis', 0, 0, 5.50, true, false, 'A hot blue supergiant, part of the Puppis constellation.', 6);


--
-- Name: cosmos_join_cosmos_join_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cosmos_join_cosmos_join_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cosmos_join cosmos_join_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmos_join
    ADD CONSTRAINT cosmos_join_name_key UNIQUE (name);


--
-- Name: cosmos_join cosmos_join_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmos_join
    ADD CONSTRAINT cosmos_join_pkey PRIMARY KEY (cosmos_join_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

