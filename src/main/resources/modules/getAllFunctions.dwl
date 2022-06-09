%dw 2.0
import p from Mule

//Set Common True-False set in CDM
fun setTrueOrFalse(value)=
	if (isEmpty(value)) false 
	else if ( p('true.characters') contains (value) )
		true
	else
		false

//To get gender field transformed value for CEDS
fun getGender(gender)=
	if ( p('common.gender.in.male') contains (gender) ) 
 		p('common.gender.out.male')
	else if ( p('common.gender.in.female') contains (gender) ) 
 		p('common.gender.out.female')
 	else 
 		p('common.gender.out.unspecified')

//To get yearLevel field transformed for CEDS DB
fun getCedsYearLevel(yearLevel)=
if (yearLevel == p('common.yearLevel.in.y1')) 
		p('common.yearLevel.out.y1')
 	else if(yearLevel == p('common.yearLevel.in.y2')) 
		p('common.yearLevel.out.y2')
 	else if(yearLevel == p('common.yearLevel.in.y3')) 
 		p('common.yearLevel.out.y3')
	else if(yearLevel == p('common.yearLevel.in.y4')) 
		p('common.yearLevel.out.y4')
 	else if(yearLevel == p('common.yearLevel.in.y5')) 
		p('common.yearLevel.out.y5')
 	else if(yearLevel == p('common.yearLevel.in.y6')) 
 		p('common.yearLevel.out.y6')
	else if(yearLevel == p('common.yearLevel.in.y7')) 
		p('common.yearLevel.out.y7')
	else if(yearLevel == p("common.yearLevel.in.y8")) 
 		p('common.yearLevel.out.y8')
 	else if(yearLevel == p('common.yearLevel.in.y9')) 
		p('common.yearLevel.out.y9')
 	else if(yearLevel == p('common.yearLevel.in.y10')) 
		p('common.yearLevel.out.y10')
 	else if(yearLevel == p('common.yearLevel.in.y11')) 
		p('common.yearLevel.out.y11')
 	else if(yearLevel == p('common.yearLevel.in.y12')) 
		p('common.yearLevel.out.y12')
 	else if(yearLevel == p('common.yearLevel.in.y12P')) 
		p('common.yearLevel.out.y12P')
 	else if(yearLevel == p('common.yearLevel.in.yPE')) 
 		p('common.yearLevel.out.yPE')
	else if(yearLevel == p('common.yearLevel.in.yRE')) 
		p('common.yearLevel.out.yRE')
 	else 
 		p('common.yearLevel.out.notSpecified')
 		
 		
 //
fun getCountryName(countryMap, birthCountry) = 
	(countryMap filter ((item, index) -> item.absCode == birthCountry))[0].countryName default ""

