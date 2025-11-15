
def get_max_num_from_list(inplist):
    max_num = int(inplist[0])  # assume first element is max
    for num in inplist:  # loop through each number
        if int(num) > max_num:  # compare
            max_num = int(num)
    return max_num

