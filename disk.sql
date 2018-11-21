--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-11-21 18:49:57 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16857)
-- Name: disk; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA disk;


ALTER SCHEMA disk OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = disk, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 16870)
-- Name: midia; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE midia (
    cd_midia character varying NOT NULL
);


ALTER TABLE midia OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16876)
-- Name: palavras; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE palavras (
    cd_palavra text NOT NULL
);


ALTER TABLE palavras OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16864)
-- Name: postagem; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE postagem (
    cd_post character varying NOT NULL,
    ds_texto character varying(350)
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16858)
-- Name: usuario; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE usuario (
    cd_usuario integer NOT NULL,
    ds_email character varying(100),
    ds_senha character varying,
    nm_nome character varying(100)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2160 (class 0 OID 16870)
-- Dependencies: 184
-- Data for Name: midia; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY midia (cd_midia) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 16876)
-- Dependencies: 185
-- Data for Name: palavras; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY palavras (cd_palavra) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 16864)
-- Dependencies: 183
-- Data for Name: postagem; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY postagem (cd_post, ds_texto) FROM stdin;
\.


--
-- TOC entry 2158 (class 0 OID 16858)
-- Dependencies: 182
-- Data for Name: usuario; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY usuario (cd_usuario, ds_email, ds_senha, nm_nome) FROM stdin;
\.


--
-- TOC entry 2039 (class 2606 OID 25057)
-- Name: pk_midia; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY midia
    ADD CONSTRAINT pk_midia PRIMARY KEY (cd_midia);


--
-- TOC entry 2041 (class 2606 OID 25059)
-- Name: pk_palavra; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY palavras
    ADD CONSTRAINT pk_palavra PRIMARY KEY (cd_palavra);


--
-- TOC entry 2037 (class 2606 OID 25061)
-- Name: pk_post; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_post PRIMARY KEY (cd_post);


--
-- TOC entry 2035 (class 2606 OID 25063)
-- Name: pk_usuario; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 2043 (class 2606 OID 25069)
-- Name: fk_midia_cd_midia; Type: FK CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY midia
    ADD CONSTRAINT fk_midia_cd_midia FOREIGN KEY (cd_midia) REFERENCES postagem(cd_post);


--
-- TOC entry 2042 (class 2606 OID 25064)
-- Name: fk_usuario_cd_usuario; Type: FK CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_usuario_cd_usuario FOREIGN KEY (cd_post) REFERENCES midia(cd_midia);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-21 18:49:58 BRST

--
-- PostgreSQL database dump complete
--

