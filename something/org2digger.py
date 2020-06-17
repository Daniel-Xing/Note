import argparse

parser=argparse.ArgumentParser()

parser.add_argument("--input",type=str,default="/root/Note/labelproject.org",
                    help="")
parser.add_argument("--output",type=str,default="/root/Note/labelproject",
                    help="")

args=parser.parse_args()

def process(line):
    for i in range(len(line)):
        if line[i]!="*":
            break
    newline=(6-i)*"="+line[i:len(line)-1]+(6-i)*"="+"\n"
    return newline

def main():
    writer=open(args.output,"w+")
    with open(args.input,"r") as reader:
        for line in reader:
            if line[0]=="*":
                line=process(line)
            writer.write(line)
        writer.close()

if __name__=="__main__":
    main()
