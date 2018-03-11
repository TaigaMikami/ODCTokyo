import sys
import random
evaluation_point = int(sys.argv[1])+random.randint(50,70)

if evaluation_point > 100:
    print(100 - random.randint(5,10))
else:
    print(int(sys.argv[1])+random.randint(50,70))
