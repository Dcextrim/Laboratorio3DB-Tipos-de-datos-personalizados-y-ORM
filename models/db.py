from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


from sqlalchemy import create_engine
def generate_schema_sql():
    """
    Genera el archivo schema.sql basado en los modelos SQLAlchemy
    """
    
    def dump(sql, *multiparams, **params):
        sql_statements.append(str(sql.compile(dialect=engine.dialect)) + ';')
    
    engine = create_engine('postgresql://', strategy='mock', executor=dump)
    sql_statements = []
    
    # Header del archivo
    header = """-- ============================================================
-- Laboratorio 3 - Base de Datos 1 - Generado con SQLAlchemy
-- Dulce Ambrosio - 231143
-- Daniel Chet - 231177
-- ============================================================

-- Eliminar tablas si existen
DROP TABLE IF EXISTS inventario CASCADE;
DROP TABLE IF EXISTS renta CASCADE;
DROP TABLE IF EXISTS detalle_renta CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS instrumento CASCADE;

-- Eliminar tipos si existen
DROP TYPE IF EXISTS estado_instrumento_enum CASCADE;
DROP TYPE IF EXISTS estado_renta_enum CASCADE;
DROP TYPE IF EXISTS tipo_instrumentos CASCADE;
DROP DOMAIN IF EXISTS dinero CASCADE;

-- ---------------------------
-- 1. Tipos y dominios personalizados
-- ---------------------------
CREATE DOMAIN dinero NUMERIC(10,2) CHECK (VALUE >= 0);

CREATE TYPE estado_instrumento_enum AS ENUM ('Disponible', 'Rentado', 'Mantenimiento');
CREATE TYPE estado_renta_enum AS ENUM ('Activa', 'Finalizada', 'Cancelada');
CREATE TYPE tipo_instrumentos AS ENUM ('Viento', 'Metal', 'Percusión', 'Cuerdas', 'Electrofonos');

COMMENT ON DOMAIN dinero IS 'Valores monetarios >= 0 con 2 decimales';
COMMENT ON TYPE estado_instrumento_enum IS 'Estado físico del instrumento';
COMMENT ON TYPE estado_renta_enum IS 'Estado general de una renta (activa, finalizada, cancelada)';

-- ---------------------------
-- 2. DDL - Tablas
-- ---------------------------

"""
    
    # Generar DDL
    db.metadata.create_all(engine, checkfirst=False)
    
    # Combinar header con DDL generado
    complete_sql = header + '\n'.join(sql_statements)
    
    # Escribir al archivo
    with open('schema.sql', 'w', encoding='utf-8') as f:
        f.write(complete_sql)
    
    print("Archivo schema.sql generado")