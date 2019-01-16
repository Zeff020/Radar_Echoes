import matplotlib.pyplot as plt

def FileImport(filename):
    
    import os
    import csv
    
    os.chdir(r'C:\Users\WolffsZef(StudMSP)\Desktop\Radar Echoes') # Here goes the path to the file you 
    data = open(filename, "rt").readlines()
    
    for i in range(0,len(data)):
        data[i] = data[i].replace("\t", " ")
    
    csv_dict = csv.DictReader(data, delimiter=" ")
    
    return csv_dict

def CreateAxes(csv_dict):
    
    x = {}
    TimeList = []
    AmplitudeList= []
    FrequencyList = []
    for item in csv_dict:
        x.update(item)
        TimeList.append(x["hh:mm:ss"])
        AmplitudeList.append(x["Peak1_Ampl"])
        FrequencyList.append(x["Peak2_Freq"])
        
    return TimeList, AmplitudeList, FrequencyList
        
csv_dict = FileImport("14thJanuary_s1354.txt")
TimeList, AmplitudeList, FrequencyList = CreateAxes(csv_dict)

plt.plot(TimeList,AmplitudeList)
plt.show()