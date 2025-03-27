function test()
    x=1:10;
    y=sin (x);
    xc=1:0.1:10;

    subplot(1,2,1);
    yc=interpLagrange(x,y,xc);
    plot(x,y,'*',xc,yc,'-');
    
    subplot(1,2,2);
    yc1=interpLagrangeNewton(x,y,xc);
    plot(x,y,'*',xc,yc1,'-');
