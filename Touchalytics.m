
%%-----------Loading the Feature Extraction data in matlab -----------
data = readtable('./features/featMat.csv');



%%--Removing phone ID,user ID, and document ID from the data set. Frank et
%%al says this should not be used for testing
data = data(:,[3:12,14:34]);


%%Removing missing bits of data and 
data = rmmissing(data);


%%Feature Scaling - Standardization - Will write a function to do all of
%%this later

Var3 = (data.Var3 - mean(data.Var3))/ std(data.Var3);
data.Var3 = Var3;


Var4 = (data.Var4 - mean(data.Var4))/ std(data.Var4);
data.Var4 = Var4;

Var5 = (data.Var5 - mean(data.Var5))/ std(data.Var5);
data.Var5 = Var5;


Var6 = (data.Var6 - mean(data.Var6))/ std(data.Var6);
data.Var6 = Var6;


Var7 = (data.Var7 - mean(data.Var7))/ std(data.Var7);
data.Var7 = Var7;


Var8 = (data.Var8 - mean(data.Var8))/ std(data.Var8);
data.Var8 = Var8;

Var9 = (data.Var9 - mean(data.Var9))/ std(data.Var9);
data.Var9 = Var9;


Var10 = (data.Var10 - mean(data.Var10))/ std(data.Var10);
data.Var10 = Var10;

Var11 = (data.Var11 - mean(data.Var11))/ std(data.Var11);
data.Var11 = Var11;


Var12 = (data.Var12 - mean(data.Var12))/ std(data.Var12);
data.Var12 = Var12;

%%Var13 = (data.Var13 - mean(data.Var13))/ std(data.Var13);
%%data.Var13 = Var13;


Var14 = (data.Var14 - mean(data.Var14))/ std(data.Var14);
data.Var14 = Var14;


Var15 = (data.Var15 - mean(data.Var15))/ std(data.Var15);
data.Var15 = Var15;


Var16 = (data.Var16 - mean(data.Var16))/ std(data.Var16);
data.Var16 = Var16;

Var17 = (data.Var17 - mean(data.Var17))/ std(data.Var17);
data.Var17 = Var17;


Var18 = (data.Var18 - mean(data.Var18))/ std(data.Var18);
data.Var18 = Var18;

Var19 = (data.Var19 - mean(data.Var19))/ std(data.Var19);
data.Var19 = Var19;


Var20 = (data.Var20 - mean(data.Var20))/ std(data.Var20);
data.Var20 = Var20;

Var21 = (data.Var21 - mean(data.Var21))/ std(data.Var21);
data.Var21 = Var21;


Var22 = (data.Var22 - mean(data.Var22))/ std(data.Var22);
data.Var22 = Var22;


Var23 = (data.Var23 - mean(data.Var23))/ std(data.Var23);
data.Var23 = Var23;


Var24 = (data.Var24 - mean(data.Var24))/ std(data.Var24);
data.Var24 = Var24;

Var25 = (data.Var25 - mean(data.Var25))/ std(data.Var25);
data.Var25 = Var25;


Var26 = (data.Var26 - mean(data.Var26))/ std(data.Var26);
data.Var26 = Var26;

Var27 = (data.Var27 - mean(data.Var27))/ std(data.Var27);
data.Var27 = Var27;


Var28 = (data.Var28 - mean(data.Var28))/ std(data.Var28);
data.Var28 = Var28;

Var29 = (data.Var29 - mean(data.Var29))/ std(data.Var29);
data.Var29 = Var29;


Var30 = (data.Var30 - mean(data.Var30))/ std(data.Var30);
data.Var30 = Var30;


Var31 = (data.Var31 - mean(data.Var31))/ std(data.Var31);
data.Var31 = Var31;


Var32 = (data.Var32 - mean(data.Var32))/ std(data.Var32);
data.Var32 = Var32;

Var33 = (data.Var33 - mean(data.Var33))/ std(data.Var3);
data.Var33 = Var33;


Var34 = (data.Var34 - mean(data.Var34))/ std(data.Var34);
data.Var34 = Var34;


%%Converting the table into a numerical array. The PCA function won't work
%%otherwise
data=data{:,:};



% Calculate eigenvalues and eigenvectors of the covariance matrix
covarianceMatrix = cov(data);

%V is a matrix of all the eigenvectors and D is a matrix of their
% corresponding values 
[V,D] = eig(covarianceMatrix);

% Printing the values of D
D

% The last 5 columns in D have the highest eigenvalues. These correspond to
% the last 5 columns in the dataset: Please see attached picture They are-
%  'mid_stroke_pressure'
%  'mid_stroke_area_covered'
%  'mid_stroke_finger_orientation'
% 'change_of_finger_orientation'
%  'phone_orientation'

%%Implementing the pca 
[coeff,score,latent,~,explained] = pca(data);

%%Finding the  principal components by multiplying the transpose of the
%%coeff by the acutal data set. This is:
% Multiply the original data by the principal component vectors to get the projections of the original data on the
% principal component vector space. This is also the output "score". Compare ...

pc =  coeff'* data';




% plot PCA space of the first two PCs: PC1 and PC2
xlabel("1st PC");
ylabel("2nd PC");
x = pc(1,:);
y = pc(2,:);
plot(x,y,'.')  
xlabel('1st PCA')
ylabel('2nd PCA')





