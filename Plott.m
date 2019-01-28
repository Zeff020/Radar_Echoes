Yaxis = [26, 15, 42, 34, 28, 34];
YYaxis = [33, 42, 34, 43, 42 ,35];
Xaxis = [1, 2, 3, 4, 5, 6];

cs = csapi(Xaxis,Yaxis);
fnplt(cs,2)
hold on
plot(Xaxis,Yaxis,'bO')
Error1 = Yaxis * 0.371;
a = errorbar(1:6,Yaxis,Error1,'.')
%LowError = Yaxis - Error1;
%HighError = Yaxis + Error1;

%cs = csapi(Xaxis,HighError);
%fnplt(cs,2,'b--');

%cs = csapi(Xaxis,LowError);
%fnplt(cs,2,'b--');

cs = csapi(Xaxis,YYaxis);
fnplt(cs,2)
hold on
plot(Xaxis,YYaxis,'rO','MarkerEdgeColor', [0.9290    0.6940    0.1250])
Error2 = YYaxis * 0.371;
b = errorbar(1:6,YYaxis,Error2,'.')
%LowError = YYaxis - Error2;
%HighError = YYaxis + Error2;
b.Color = [0.9290    0.6940    0.1250];
a.Color = [ 0    0.4470    0.7410];
%cs = csapi(Xaxis,HighError);
%fnplt(cs,2,'r--');

%cs = csapi(Xaxis,LowError);
%fnplt(cs,2,'r--');