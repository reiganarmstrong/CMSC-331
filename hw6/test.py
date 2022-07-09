from random import randint, sample


def check_correct_ticket(ticket):
    ticket = ticket.split()
    print(ticket)

    for i in range(0, len(ticket)):
        ticket[i] = int(ticket[i])
    print(ticket)

    k = 0
    for i in range(0, len(ticket) - 1):
        if ticket[i] < 1 or ticket[i] > 69:
            k += 1
        else:
            k += 0
    if ticket[(len(ticket)) - 1] > 26 or ticket[(len(ticket)) - 1] < 1:
        k += 1
    else:
        k += 0
    return k


def get_ticket():
    white_balls = sample(range(1, 70), 5)
    white_balls.sort()
    ticket = (white_balls, randint(1, 26))
    return ticket


'def check_ticket(test_ticket, winning_ticket, grand_prize):'

if __name__ == '__main__':
    winning_ticket = input("what is the winning ticket? (put powerball last)")
    print(check_correct_ticket(winning_ticket))
