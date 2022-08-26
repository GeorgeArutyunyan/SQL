import sqlalchemy
from sqlalchemy.orm import sessionmaker
from models import create_table, Shop, Publisher, Book, Stock, Sale
from config import database, user, password, server
import json

DNS = f'{database}://{user}:{password}@localhost:5432/{server}'
engine = sqlalchemy.create_engine(DNS)

create_table(engine)

Session = sessionmaker(bind=engine)
session = Session()
with open('data.json') as f:
    data = json.load(f)


    def filling_db(info: dict) -> None:
        for item in info:
            if item['table'] == 'publisher':
                publisher = Publisher(publisher_id=item['pk'], publisher_name=item['fields']['name'])
                session.add(publisher)
            elif item['table'] == 'book':
                book = Book(book_id=item['pk'], title=item['fields']['title'],
                            publisher_id=item['fields']['publisher_id'])
                session.add(book)
            elif item['table'] == 'shop':
                shop = Shop(shop_id=item['pk'], shop_name=item['fields']['shop_name'])
                session.add(shop)
            elif item['table'] == 'stock':
                stock = Stock(stock_id=item['pk'], book_id=item['fields']['book_id'],
                              shop_id=item['fields']['shop_id'], count=item['fields']['count'])
                session.add(stock)
            else:
                sale = Sale(sale_id=item['pk'], price=item['fields']['price'], date_sale=item['fields']['date_sale'],
                            stock_id=item['fields']['stock_id'], count=item['fields']['count'])
                session.add(sale)
            session.commit()


    filling_db(data)


    def get_publisher() -> str:
        choice = input('Please, input id or name of publisher')
        shop = []
        if choice.isdigit():
            for item in session.query(Shop).join(Stock, Shop.shop_id == Stock.shop_id). \
                    join(Book, Stock.book_id == Book.book_id).join(Publisher,
                                                                   Book.publisher_id == Publisher.publisher_id). \
                    filter(Publisher.publisher_id == int(choice)).all():
                shop.append(item.shop_name)
            if shop:
                return f'publisher release books in shop {", ".join(str(i) for i in shop)}'
            return f'No publisher with id {choice}'
        else:
            for item in session.query(Shop).join(Stock, Shop.shop_id == Stock.shop_id). \
                    join(Book, Stock.book_id == Book.book_id).join(Publisher,
                                                                   Book.publisher_id == Publisher.publisher_id). \
                    filter(Publisher.publisher_name == choice).all():
                shop += item.shop_name
            if shop:
                return f'publisher release books in shop {", ".join(str(i) for i in shop)}'
            return f'No publisher with name {choice}'

print(get_publisher())
session.close()
