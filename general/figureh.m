function y = figureh(num,xx,yy,data,opt,ftitle)
%
% figureh: ploting 2D matrix / monochrome image based on the imagesc
%
% [[Usage]]
% figureh(num,xx,yy,data,opt,ftitle)
% figureh(num,xx,yy,data,opt)
% figureh(num,xx,yy,data)
% figureh(num,data,opt,ftitle)
% figureh(num,data,ftitle)
% figureh(num,data,opt)
% figureh(num,data)
% figureh(data)
%
% [[Available options]]
% 'mim': ploting image with range 0~2^12-1(4095)
% 'noaxis': removing grid on image
% 'jpg': ploting image with range 0~2^8-1(255)
%
% [[Version History]]
% 1.1 / 2013-11-23: initial release
% 1.2 / 2014-01-09: added option "title" to adding title
% 1.2.1 / 2014-02-13: minor bug fix
% 1.3 / 2015-07-24: added custom axis option
% 1.3.1 / 2015-07-31: added compatibility - 4 parameters options
%
if(nargin==5) 
    figure(num)
    ftitle='';
    imagesc(xx,yy,data)
elseif(nargin==4) 
    if(ischar(yy)==1)
        ftitle=data;
        opt=yy;
        data=xx;
        imagesc(data)
    else
        figure(num)
        ftitle='';
        opt='';
        imagesc(xx,yy,data)
    end
elseif(nargin==3) 
    figure(num)
    ftitle='';
    opt=yy;
    data=xx;
    imagesc(data)
elseif(nargin==2) 
    figure(num)
    opt='';
    ftitle='';
    data=xx;
    imagesc(data)
elseif(nargin==1) 
    data=num;
    figure();
    opt='';
    ftitle='';
    imagesc(data)
else
    figure(num);
end

colormap gray
axis image

switch opt
    case 'mim'
        caxis([0 4095])
        title(ftitle)
    case 'noaxis'
        axis off
        title(ftitle)
    case 'jpg'
        caxis([0 255])
        title(ftitle)
    otherwise
        title(opt);
end
        
        
    