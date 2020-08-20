clear all
cd "C:\Users\user\Downloads\634-Modulo18"

u enaho01-2018-612
sort nconglome conglome vivienda hogar
merge m:1 nconglome conglome vivienda hogar using sumaria-2018, nogen

g area=1
replace area=0 if estrato>=6
*Hogares urbanos por tenencia de activos
tab p612n if area==1  [iw=factor07], m

tab p612n if p612==1 & area==1 & p612n==10 [iw=factor07]

*keep if p612n==10
keep if p612n==16

***Cuadro no considera valores missing
table area [iw=factor07] if p612n==16, c(sum p612) row format (%7.0g)

tab p612 [iw=factor07] if p612n==16 & area==1, m
