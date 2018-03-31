city1 = City.create(title: 'Lviv')
city2 = City.create(title: 'Lutsk')

user_first  = User.create(email: 'user_first@mail.com', name: 'first', city: city1)
user_second = User.create(email: 'user_first@mail.com', name: 'second', city: city1)
user_third = User.create(email: 'user_first@mail.com', name: 'second', city: city2)

item1  = user_first.items.create(name: 'item1')
item2  = user_first.items.create(name: 'item2')
item3  = user_first.items.create(name: 'item3')
item4  = user_first.items.create(name: 'item4')
item5  = user_first.items.create(name: 'item5')

item6  = user_second.items.create(name: 'item6')
item7  = user_second.items.create(name: 'item7')
item8  = user_second.items.create(name: 'item8')
item9  = user_second.items.create(name: 'item9')
item10 = user_second.items.create(name: 'item10')

Review.create(title: 'review1', body: 'body1', user: user_first,  object: item1)
Review.create(title: 'review2', body: 'body2', user: user_first,  object: item2)
Review.create(title: 'review3', body: 'body3', user: user_first,  object: item3)
Review.create(title: 'review4', body: 'body4', user: user_second, object: item4)
Review.create(title: 'review5', body: 'body5', user: user_second, object: item5)
Review.create(title: 'review6', body: 'body6', user: user_first,  object: item6)
Review.create(title: 'review7', body: 'body7', user: user_second, object: item7)
Review.create(title: 'review8', body: 'body8', user: user_first,  object: item8)
Review.create(title: 'review9', body: 'body9', user: user_first,  object: item9)

Review.create(title:  'review10', body: 'body10', user: user_second,
              object: item10)

Review.create(title:  'review11', body: 'body11', user: user_second,
              object: user_first)
Review.create(title:  'review12', body: 'body12', user: user_first,
              object: user_second)
Review.create(title:  'review13', body: 'body13', user: user_second,
              object: user_first)

date = Date.today - 5.month

Booking.create(start_date: date,
               end_date:   (date + 1.month),
               user:       user_second,
               item:       item1)

Booking.create(start_date: (date + 1.month),
               end_date:   (date + 2.month),
               user:       user_second,
               item:       item4)

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
               user:       user_first,
               item:       item7)