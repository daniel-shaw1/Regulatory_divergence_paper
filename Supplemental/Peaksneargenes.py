#to pull data from file:
def pull_data():
	data = []
	peaks = []
	with open("XIXLiver-2macs_peaks.xls", 'r') as macs_data:
		for line in macs_data:
			if line.startswith("#"):
				continue
			else:
				data += line.split()
		Chr=data[10::10]
		Start=data[11::10]
		End=data[12::10]
		Length=data[13::10]
		Summit=data[14::10]
		Pileup=data[15::10]
		Fold=data[17::10]
		for index,value in enumerate(Chr):
			peaks.append(value)
			peaks.append(Start[index])
			peaks.append(End[index])
			peaks.append(Length[index])
			peaks.append(Summit[index])
			peaks.append(Pileup[index])
			peaks.append(Fold[index])
	return peaks 
	
	
	
def pull_data2():
        data = []
        vcf = []
        with open("TSSGTFtabbed.txt", 'r') as vcffile:
                for line in vcffile:
                        if line.startswith("#"):
                                continue
                        else:
                                data += line.split()
                Chr=data[0::8]
                Start=data[1::8]
                End=data[2::8]
                TSSstart=data[3::8]
                TSSend=data[4::8]
                Ensembl=data[5::8]
                EnsemblT=data[6::8]
                Genename=data[7::8]
                for index,value in enumerate(Chr):
                        vcf.append(value)
                        vcf.append(Start[index])
                        vcf.append(End[index])
                        vcf.append(TSSstart[index])
                        vcf.append(TSSend[index])
                        vcf.append(Ensembl[index])
                        vcf.append(EnsemblT[index])
                        vcf.append(Genename[index])
        return vcf

def compare():
        peaks=pull_data()
        TSS=pull_data1()
        Chr=peaks[0::7]
        Start=peaks[1::7]
        End=peaks[2::7]
        Length=peaks[3::7]
        Summit=peaks[4::7]
        Pileup=peaks[5::7]
        Fold=peaks[6::7]
        GeneStart=vcf[1::8]
        GeneEnd=vcf[2::8]
        TSSstart=vcf[3::8]
        TSSend=vcf[4::8]
        Ensembl=vcf[5::8]
        EnsemblT=vcf[6::8]
        Genename=data[7::8]
        x=0
        with open("PeaksnearTSS", 'a') as out:
                while x < len(Chr):
                        for index,value in enumerate(TSSstart):
                                if int(Start[x]) >= int(value) and int(End[x]) <= int(TSSend[index]):
                                        out.write(str(Chr[x]) + '\t' + str(Start[x]) + '\t' + str(End[x]) + '\t' + str(Length[x]) + '\t' + str(Summit[x]) + '\t' + str(Pileup[x]) + '\t' + str(Fold[x]) + '\t' + $
                        x+=1
compare()
