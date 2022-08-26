import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class Publisher(Base):
    __tablename__ = 'publisher'

    publisher_id = sq.Column(sq.Integer, primary_key=True)
    publisher_name = sq.Column(sq.VARCHAR(30), unique=True)

    def __str__(self):
        return f'publisher name: {self.publisher_name}, publisher id: {self.publisher_id}'

    book = relationship('Book', back_populates='publisher')


class Book(Base):
    __tablename__ = 'book'

    book_id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.VARCHAR(30))
    publisher_id = sq.Column(sq.Integer, sq.ForeignKey('publisher.publisher_id'), nullable=False)

    def __str__(self):
        return f'book id: {self.book_id}, book title: {self.title}, publisher id :{self.publisher_id}'

    publisher = relationship(Publisher, back_populates='book')


class Shop(Base):
    __tablename__ = 'shop'

    shop_id = sq.Column(sq.Integer, primary_key=True)
    shop_name = sq.Column(sq.VARCHAR(30))

    def __str__(self):
        return f'shop id: {self.shop_id}, shop name: {self.shop_name}'


class Stock(Base):
    __tablename__ = 'stock'

    stock_id = sq.Column(sq.Integer, primary_key=True)
    book_id = sq.Column(sq.Integer, sq.ForeignKey('book.book_id'), nullable=False)
    shop_id = sq.Column(sq.Integer, sq.ForeignKey('shop.shop_id'), nullable=False)
    count = sq.Column(sq.Integer)

    def __str__(self):
        return f'stock id: {self.stock_id}, book id: {self.book_id}, ' \
               f'shop id: {self.shop_id}, count: {self.count}'

    book = relationship(Book, backref='book')
    shop = relationship(Shop, backref='shop')


class Sale(Base):
    __tablename__ = 'sale'

    sale_id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.DECIMAL)
    date_sale = sq.Column(sq.DateTime)
    stock_id = sq.Column(sq.Integer, sq.ForeignKey('stock.stock_id'))
    count = sq.Column(sq.Integer)

    def __str__(self):
        return f'sale id: {self.sale_id}, price: {self.price}, ' \
               f'sale date: {self.date_sale}, stock id: {self.stock_id}, count{self.count}'

    stock = relationship(Stock, backref='stock')


def create_table(engine):
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
