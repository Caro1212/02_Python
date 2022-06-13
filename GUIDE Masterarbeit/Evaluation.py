def complexity(output_file):
    with open(output_file, "r") as file:
        for position, line in enumerate(file):
            if "Total number of nodes of final tree" in line:
                total = line
            elif "Number of terminal nodes of final tree" in line:
                final = line
            elif "******" in line:
                begin = position+3

    with open(output_file, "r") as file:
        lines = file.readlines()
    lines = lines[begin::]
    index = len("Total number of nodes of final tree: ")
    number_of_nodes = int(total[index:-1])
    index = len("Number of terminal nodes of final tree: ")
    number_of_final = int(final[index:-1])

    return number_of_final