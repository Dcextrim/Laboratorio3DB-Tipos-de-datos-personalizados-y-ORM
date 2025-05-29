from .db import db

class Inventario(db.Model):
    __tablename__ = 'inventario'
    id_inventario = db.Column(db.Integer, primary_key=True)
    id_instrumento = db.Column(db.Integer, db.ForeignKey('instrumento.id_instrumento', ondelete="CASCADE"), nullable=False, unique=True)
    cant_instrumento = db.Column(db.Integer, nullable=False)
    instrumento = db.relationship('Instrumento')