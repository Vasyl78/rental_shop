city1 = City.create(title: 'Lviv')
city2 = City.create(title: 'Lutsk')

user_first  = User.create(email: 'user_first@mail.com', name: 'first',
                          city: city1)
user_second = User.create(email: 'user_first@mail.com', name: 'second',
                          city: city1)
user_third  = User.create(email: 'user_first@mail.com', name: 'second',
                          city: city2)

category1 = Category.create(name: 'Cable binding')
category2 = Category.create(name: 'Ski helmet')
category3 = Category.create(name: 'Ski binding')
category4 = Category.create(name: 'Ski skins')
category5 = Category.create(name: 'Nava System')

item1  = user_first.items.create(name:  'item1', category: category1,
                                 brand: 'B1',    size:     38,
                                 daily_price: 45)

item2  = user_first.items.create(name:  'item2', category: category2,
                                 brand: 'B2',    size:     39,
                                 daily_price: 30)

item3  = user_first.items.create(name:  'item3', category: category3,
                                 brand: 'B3',    size:     40,
                                 daily_price: 40)

item4  = user_first.items.create(name:  'item4', category: category4,
                                 brand: 'B4',    size:     41,
                                 daily_price: 50)

item5  = user_first.items.create(name:  'item5', category: category5,
                                 brand: 'B3',    size:     42,
                                 daily_price: 20,)

item6  = user_second.items.create(name:  'item6', category: category1,
                                  brand: 'B2',    size:     43,
                                  daily_price: 9)

item7  = user_second.items.create(name:  'item7', category: category2,
                                  brand: 'B5',    size:     42,
                                  daily_price: 47)

item8  = user_second.items.create(name:  'item8', category: category3,
                                  brand: 'B3',    size:     45,
                                  daily_price: 65)

item9  = user_second.items.create(name:  'item9', category: category4,
                                  brand: 'B2',    size:     43,
                                  daily_price: 90)

item10 = user_second.items.create(name:  'item10', category: category5,
                                  brand: 'B4',     size:     42,
                                  daily_price: 70)

item11 = user_third.items.create(name:  'item11', category: category1,
                                 brand: 'B2',     size:     44,
                                 daily_price: 204)

item12 = user_third.items.create(name:  'item12', category: category2,
                                 brand: 'B2',     size:     43,
                                 daily_price: 93)

item13 = user_third.items.create(name:  'item13', category: category3,
                                 brand: 'B2',     size:     43,
                                 daily_price: 85)

date = Date.today - 5.month

Booking.create(start_date: date,
               end_date:   (date + 1.month),
               user:       user_second,
               item:       item1)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 2.month),
               user:       user_second,
               item:       item2)

Booking.create(start_date: (date + 3.month),
               end_date:   (date + 4.month),
               user:       user_first,
               item:       item10)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 3.month),
               user:       user_first,
               item:       item8)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 4.month),
               user:       user_second,
               item:       item3)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 4.month),
               user:       user_first,
               item:       item11)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 4.month),
               user:       user_first,
               item:       item12)

Booking.create(start_date: (date + 3.month),
               end_date:   (date + 5.month),
               user:       user_second,
               item:       item13)

Booking.create(start_date: (date + 3.month),
               end_date:   (date + 4.month),
               user:       user_second,
               item:       item4)

Booking.create(start_date: (date + 2.month),
               end_date:   (date + 5.month),
               user:       user_second,
               item:       item5)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 3.month),
               user:       user_first,
               item:       item6)

Booking.create(start_date: (date + 2.month),
               end_date:   (date + 3.month),
               user:       user_first,
               item:       item7)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 5.month),
               user:       user_first,
               item:       item9)

Review.create(title: 'review1', body: 'body1', user: user_second, object: item1)
Review.create(title: 'review2', body: 'body2', user: user_second, object: item2)
Review.create(title: 'review3', body: 'body3', user: user_second, object: item3)

Review.create(title:  'review10', body: 'body10', user: user_first,
              object: item10)

Review.create(title:  'review11', body: 'body11', user: user_second,
              object: user_first)

Review.create(title:  'review12', body: 'body12', user: user_first,
              object: user_second)
