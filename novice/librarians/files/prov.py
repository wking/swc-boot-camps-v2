
def read_prov():
    f = open('provinces.txt')
    all_lines = f.readlines()
    line_number = 0
    for line in all_lines:
        print str(line_number) + ": " + line, 
        line_number = line_number + 1
    f.close()

def write_out():
    f = open('my_out.txt','w')
    for word in ["the","quick","brown","fox"]:
        f.write(word + "\n") 
    f.close() 

def read_circ():
    fh = open('library-card.txt')
    all_lines = fh.readlines()
    fh.close()
    due_dates = all_lines[3:len(all_lines)]
    fh = open('library-card-b.txt','w')
    for i in range(3):
        fh.write(all_lines[i])

    for line in due_dates:
        line = line.strip('\n')
        field = line.split(' ')
        
        if len(field[2]) == 2:
            field[2] = "19" + field[2]

        if len(field[2]) == 3:
            field[2] = "19" + field[2][1:]

        fh.write(field[0] + " " + field[1] + " " + field[2] +"\n")
    # print out the first three lines, title, author, etc.
    fh.close()