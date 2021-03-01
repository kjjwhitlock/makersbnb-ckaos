```
classes:

User            responsibilities:         collaborators:     
                id, password, email,      Space
                username, name

                rented listings,  
                currently hosting, id

Space           responsibilities:         collaborators:
                id, name, description,    User
                price per night

                host id:
                references User id
                renters id


<!-- ActiveBookings  responsibilities          collaborators:
                     space id:                 User
                     renters id                Space -->



dbnames:

makersbnb: users, spaces
makersbnb_test: users, spaces


```
