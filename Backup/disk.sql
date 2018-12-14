--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-11-26 19:30:32 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 33074)
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
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = disk, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 33129)
-- Name: administrador; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE administrador (
    ds_email character varying,
    ds_senha character varying(15),
    nm_nome character varying(15),
    cd_adm character varying NOT NULL
);


ALTER TABLE administrador OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33075)
-- Name: midia; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE midia (
    pk_cd_midia character varying NOT NULL,
    fk_cd_post character varying,
    ds_link character varying
);


ALTER TABLE midia OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33087)
-- Name: postagem; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE postagem (
    cd_post character varying NOT NULL,
    ds_texto character varying(350),
    dt_data date,
    tm_hora time(5) with time zone,
    ds_email character varying NOT NULL,
    fk_ds_email character varying
);


ALTER TABLE postagem OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33093)
-- Name: usuario; Type: TABLE; Schema: disk; Owner: postgres
--

CREATE TABLE usuario (
    ds_email character varying(100),
    ds_senha character varying,
    nm_nome character varying(100),
    dt_nasc date,
    cd_usuario character varying NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 33129)
-- Dependencies: 185
-- Data for Name: administrador; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY administrador (ds_email, ds_senha, nm_nome, cd_adm) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 33075)
-- Dependencies: 182
-- Data for Name: midia; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY midia (pk_cd_midia, fk_cd_post, ds_link) FROM stdin;
\.


--
-- TOC entry 2162 (class 0 OID 33087)
-- Dependencies: 183
-- Data for Name: postagem; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY postagem (cd_post, ds_texto, dt_data, tm_hora, ds_email, fk_ds_email) FROM stdin;
\.


--
-- TOC entry 2163 (class 0 OID 33093)
-- Dependencies: 184
-- Data for Name: usuario; Type: TABLE DATA; Schema: disk; Owner: postgres
--

COPY usuario (ds_email, ds_senha, nm_nome, dt_nasc, cd_usuario) FROM stdin;
\.


--
-- TOC entry 2044 (class 2606 OID 33161)
-- Name: pk_cd_adm; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY administrador
    ADD CONSTRAINT pk_cd_adm PRIMARY KEY (cd_adm);


--
-- TOC entry 2036 (class 2606 OID 33100)
-- Name: pk_cd_midia; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY midia
    ADD CONSTRAINT pk_cd_midia PRIMARY KEY (pk_cd_midia);


--
-- TOC entry 2041 (class 2606 OID 33147)
-- Name: pk_cd_usuario; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_cd_usuario PRIMARY KEY (cd_usuario);


--
-- TOC entry 2039 (class 2606 OID 33145)
-- Name: pk_ds_email; Type: CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT pk_ds_email PRIMARY KEY (ds_email);


--
-- TOC entry 2042 (class 1259 OID 33159)
-- Name: fki_cd_adm; Type: INDEX; Schema: disk; Owner: postgres
--

CREATE INDEX fki_cd_adm ON administrador USING btree (cd_adm);


--
-- TOC entry 2034 (class 1259 OID 33122)
-- Name: fki_cd_post; Type: INDEX; Schema: disk; Owner: postgres
--

CREATE INDEX fki_cd_post ON midia USING btree (fk_cd_post);


--
-- TOC entry 2037 (class 1259 OID 33153)
-- Name: fki_ds_email; Type: INDEX; Schema: disk; Owner: postgres
--

CREATE INDEX fki_ds_email ON postagem USING btree (fk_ds_email);


--
-- TOC entry 2046 (class 2606 OID 33154)
-- Name: fk_cd_adm; Type: FK CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY administrador
    ADD CONSTRAINT fk_cd_adm FOREIGN KEY (cd_adm) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2045 (class 2606 OID 33148)
-- Name: fk_ds_email; Type: FK CONSTRAINT; Schema: disk; Owner: postgres
--

ALTER TABLE ONLY postagem
    ADD CONSTRAINT fk_ds_email FOREIGN KEY (fk_ds_email) REFERENCES usuario(cd_usuario);


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-26 19:30:32 BRST

--
-- PostgreSQL database dump complete
--

