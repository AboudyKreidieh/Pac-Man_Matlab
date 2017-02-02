%% Initial Data

% these are the standard coins dispersed across the terrain
coin = [(598:29:598+29*11)',135*ones(12,1);
        (1004:29:1004+29*11)',135*ones(12,1);
        598,164;
        598,164+29*2;
        743*ones(3,1),(164:29:164+29*2)';
        917*ones(3,1),(164:29:164+29*2)';
        1004*ones(3,1),(164:29:164+29*2)';
        1178*ones(3,1),(164:29:164+29*2)';
        1323,164;
        1323,164+29*2;
        (598:29:598+29*25)',251*ones(26,1);
        598*ones(3,1),(280:29:280+29*2)';
        743*ones(3,1),(280:29:280+29*2)';
        830*ones(3,1),(280:29:280+29*2)';
        1091*ones(3,1),(280:29:280+29*2)';
        1178*ones(3,1),(280:29:280+29*2)';
        1323*ones(3,1),(280:29:280+29*2)';
        (627:29:627+29*3)',338*ones(4,1);
        (859:29:859+29*2)',338*ones(3,1);
        (1004:29:1004+29*2)',338*ones(3,1);
        (1207:29:1207+29*3)',338*ones(4,1);
        743*ones(12,1),(367:31:367+31*11)';
        1178*ones(12,1),(367:31:367+31*11)';
        (598:29:598+29*4)',708*ones(5,1);
        (772:29:772+29*5)',708*ones(6,1);
        (1004:29:1004+29*5)',708*ones(6,1);
        (1207:29:1207+29*4)',708*ones(5,1);
        598*ones(2,1),(737:29:737+29)';
        743*ones(6,1),(737:29:737+29*5)';
        917*ones(3,1),(737:29:737+29*2)';
        1004*ones(3,1),(737:29:737+29*2)';
        1178*ones(6,1),(737:29:737+29*5)';
        1323*ones(2,1),(737:29:737+29)';
        (627:29:627+29)',795*ones(2,1);
        (772:29:772+29*4)',795*ones(5,1);
        (1033:29:1033+29*4)',795*ones(5,1);
        (1265:29:1265+29)',795*ones(2,1);
        656*ones(2,1),(824:29:824+29)';
        830*ones(2,1),(824:29:824+29)';
        1091*ones(2,1),(824:29:824+29)';
        1265*ones(2,1),(824:29:824+29)';
        (598:29:598+29*4)',882*ones(5,1);
        (830:29:830+29*3)',882*ones(4,1);
        (1004:29:1004+29*3)',882*ones(4,1);
        (1207:29:1207+29*4)',882*ones(5,1);
        598*ones(2,1),(911:29:911+29)';
        917*ones(2,1),(911:29:911+29)';
        1004*ones(2,1),(911:29:911+29)';
        1323*ones(2,1),(911:29:911+29)';
        (598:29:598+29*25)',975*ones(26,1)];

% position of the coins that make the ghosts vulnerable
special_coin = [598,164+29;
                1323,164+29;
                598,911-29*4;
                1323,911-29*4];

% the directions represent is the intersections allows you to move
% [up,right,down,left]
intersections = struct('pos',[598,135; 743,135; 917,135; 1004,135; 1178,135; 1323,135;
                              598,251; 743,251; 830,251; 917,251; 1004,251; 1091,251; 1178,251; 1323,251;
                              598,338; 743,338; 830,338; 917,338; 1004,338; 1091,338; 1178,338; 1323,338;
                              830,431; 917,431; 1004,431; 1091,431;
                              743,524; 830,524; 1091,524; 1178,524;
                              830,617; 1091,617;
                              598,708; 743,708; 830,708; 917,708; 1004,708; 1091,708; 1178,708; 1323,708;
                              598,795; 656,795; 743,795; 830,795; 917,795; 1004,795; 1091,795; 1178,795;
                              1265,795; 1323,795;
                              598,882;656,882; 743,882; 830,882; 917,882; 1004,882; 1091,882; 1178,882;
                              1265,882; 1323,882;
                              598,975; 917,975; 1004,975; 1323,975], ...
                       'direction',[0,1,1,0; 0,1,1,1; 0,0,1,1; 0,1,1,0; 0,1,1,1; 0,0,1,1; 1,1,1,0;
                                    1,1,1,1; 0,1,1,1; 1,1,0,1; 1,1,0,1; 0,1,1,1; 1,1,1,1; 1,0,1,1;
                                    1,1,0,0; 1,0,1,1; 1,1,0,0; 0,0,1,1; 0,1,1,0; 1,0,0,1; 1,1,1,0;
                                    1,0,0,1; 0,1,1,0; 1,1,0,1; 1,1,0,0; 0,0,1,1; 1,1,1,1; 1,0,1,1;
                                    1,1,1,0; 1,1,1,1; 1,1,1,0; 1,0,1,1; 0,1,1,0; 1,1,1,1; 1,1,0,1;
                                    0,0,1,1; 0,1,1,0; 1,1,0,1; 1,1,1,1; 0,0,1,1; 1,1,0,0; 0,0,1,1;
                                    1,1,1,0; 0,1,1,1; 1,1,0,1; 1,1,0,1; 0,1,1,1; 1,0,1,1; 0,1,1,0;
                                    1,0,0,1; 0,1,1,0; 1,1,0,1; 1,0,0,1; 1,1,0,0; 0,0,1,1; 0,1,1,0;
                                    1,0,0,1; 1,1,0,0; 1,1,0,1; 0,0,1,1; 1,1,0,0; 1,1,0,1; 1,1,0,1;
                                    1,0,0,1]);

pacman = struct('pos',[960.5,795],'direction',4);  % 1: up
                                                   % 2: right
                                                   % 3: down
                                                   % 4: left
                                                   
pacman_open = imread('Pics/Pacman-Open.png');

ghost = [struct('name','pink',   'pos',[0,0], 'direction',1, 'vulnerable',0)
         struct('name','orange', 'pos',[0,0], 'direction',1, 'vulnerable',0)
         struct('name','cyan',   'pos',[0,0], 'direction',1, 'vulnerable',0)
         struct('name','red',    'pos',[0,0], 'direction',1, 'vulnerable',0)];
     
movements = [0,-1; 1,0; 0,1; -1,0];


%% Begin Simulation

figure
imshow('Pics/PacMan Background.jpg')
hold on
available_coins = scatter(coin(:,1),coin(:,2),15,'square','filled','MarkerFaceColor',[255/255,184/255,151/255]);
available_special_coins = scatter(special_coin(:,1),special_coin(:,2),175,'filled','MarkerFaceColor',[255/255,184/255,151/255]);
full_circle = scatter(960.5,795,500,'filled','MarkerFaceColor','y');

R = 22;

th1 = linspace(-3*pi/4, pi/16, 100);
x1 = R*cos(th1) + 960.5;
y1 = R*sin(th1) + 795;
semi_top_left = fill(x1,y1,'y','edgecolor','none');

th2 = linspace(-pi/16, 3*pi/4, 100);
x2 = R*cos(th2) + 960.5;
y2 = R*sin(th2) + 795;
semi_bottom_left = fill(x2,y2,'y','edgecolor','none');

x3 = -R*cos(th2) + 960.5;
y3 = -R*sin(th2) + 795;
semi_top_right = fill(x3,y3,'y','edgecolor','none','facealpha',0);

x4 = -R*cos(th1) + 960.5;
y4 = -R*sin(th1) + 795;
semi_bottom_right = fill(x4,y4,'y','edgecolor','none','facealpha',0);

x5 = R*cos(th2+pi/2) + 960.5;
y5 = R*sin(th2+pi/2) + 795;
semi_left_top = fill(x5,y5,'y','edgecolor','none','facealpha',0);

x6 = R*cos(th2-pi/2) + 960.5;
y6 = -R*sin(th2-pi/2) + 795;
semi_right_top = fill(x6,y6,'y','edgecolor','none','facealpha',0);

x7 = -R*cos(th2+pi/2) + 960.5;
y7 = -R*sin(th2+pi/2) + 795;
semi_right_bottom = fill(x7,y7,'y','edgecolor','none','facealpha',0);

x8 = R*cos(th2+pi/2) + 960.5;
y8 = -R*sin(th2+pi/2) + 795;
semi_left_bottom = fill(x8,y8,'y','edgecolor','none','facealpha',0);

%% Iteration

for i=1:100000
    % switching between open mouth and closed mouth
    if mod(i,50)==0
        set(full_circle,'MarkerFaceColor','none')
    elseif mod(i,25)==0
        set(full_circle,'MarkerFaceColor','y')
    end
    
    % movement of pacman
    if abs(pacman.pos(1)-594)<2 && abs(pacman.pos(2)-524)<2 && pacman.direction==4
        % when at center left
        pacman.pos(1) = pacman.pos(1)+795;
        set(semi_top_left,'XData',get(semi_top_left,'XData')+795)
        set(semi_bottom_left,'XData',get(semi_bottom_left,'XData')+795)
        set(semi_top_right,'XData',get(semi_top_right,'XData')+795)
        set(semi_bottom_right,'XData',get(semi_bottom_right,'XData')+795)
        set(semi_right_top,'XData',get(semi_right_top,'XData')+795)
        set(semi_right_bottom,'XData',get(semi_right_bottom,'XData')+795)
        set(semi_left_top,'XData',get(semi_left_top,'XData')+795)
        set(semi_left_bottom,'XData',get(semi_left_bottom,'XData')+795)
        set(full_circle,'XData',get(full_circle,'XData')+795)
    elseif abs(pacman.pos(1)-1327)<2 && abs(pacman.pos(2)-524)<2 && pacman.direction==2
        % when at center right
        pacman.pos(1) = pacman.pos(1)-795;
        set(semi_top_left,'XData',get(semi_top_left,'XData')-795)
        set(semi_bottom_left,'XData',get(semi_bottom_left,'XData')-795)
        set(semi_top_right,'XData',get(semi_top_right,'XData')-795)
        set(semi_bottom_right,'XData',get(semi_bottom_right,'XData')-795)
        set(semi_right_top,'XData',get(semi_right_top,'XData')-795)
        set(semi_right_bottom,'XData',get(semi_right_bottom,'XData')-795)
        set(semi_left_top,'XData',get(semi_left_top,'XData')-795)
        set(semi_left_bottom,'XData',get(semi_left_bottom,'XData')-795)
        set(full_circle,'XData',get(full_circle,'XData')-795)
    else
        % regular case
        pacman.pos = pacman.pos + 1.45*movements(pacman.direction,:);
        set(semi_top_left,'XData',get(semi_top_left,'XData')+1.45*movements(pacman.direction,1))
        set(semi_top_left,'YData',get(semi_top_left,'YData')+1.45*movements(pacman.direction,2))
        set(semi_bottom_left,'XData',get(semi_bottom_left,'XData')+1.45*movements(pacman.direction,1))
        set(semi_bottom_left,'YData',get(semi_bottom_left,'YData')+1.45*movements(pacman.direction,2))
        set(semi_top_right,'XData',get(semi_top_right,'XData')+1.45*movements(pacman.direction,1))
        set(semi_top_right,'YData',get(semi_top_right,'YData')+1.45*movements(pacman.direction,2))
        set(semi_bottom_right,'XData',get(semi_bottom_right,'XData')+1.45*movements(pacman.direction,1))
        set(semi_bottom_right,'YData',get(semi_bottom_right,'YData')+1.45*movements(pacman.direction,2))
        set(semi_right_top,'XData',get(semi_right_top,'XData')+1.45*movements(pacman.direction,1))
        set(semi_right_top,'YData',get(semi_right_top,'YData')+1.45*movements(pacman.direction,2))
        set(semi_right_bottom,'XData',get(semi_right_bottom,'XData')+1.45*movements(pacman.direction,1))
        set(semi_right_bottom,'YData',get(semi_right_bottom,'YData')+1.45*movements(pacman.direction,2))
        set(semi_left_top,'XData',get(semi_left_top,'XData')+1.45*movements(pacman.direction,1))
        set(semi_left_top,'YData',get(semi_left_top,'YData')+1.45*movements(pacman.direction,2))
        set(semi_left_bottom,'XData',get(semi_left_bottom,'XData')+1.45*movements(pacman.direction,1))
        set(semi_left_bottom,'YData',get(semi_left_bottom,'YData')+1.45*movements(pacman.direction,2))
        set(full_circle,'XData',get(full_circle,'XData')+1.45*movements(pacman.direction,1))
        set(full_circle,'YData',get(full_circle,'YData')+1.45*movements(pacman.direction,2))
    end
    
    % collecting regular coins
    XData = get(available_coins, 'XData');
    YData = get(available_coins, 'YData');
    coin_ind = intersect(find(abs(XData-pacman.pos(1))<5),find(abs(YData-pacman.pos(2))<5));
    if ~isempty(coin_ind)
        XData(coin_ind) = [];
        YData(coin_ind) = [];
        set(available_coins, 'XData', XData, 'YData', YData);
    end
    
    % collecting special coins
    XData = get(available_special_coins, 'XData');
    YData = get(available_special_coins, 'YData');
    coin_ind = intersect(find(abs(XData-pacman.pos(1))<5),find(abs(YData-pacman.pos(2))<5));
    if ~isempty(coin_ind)
        XData(coin_ind) = [];
        YData(coin_ind) = [];
        set(available_special_coins, 'XData', XData, 'YData', YData);
    end
    
    % pacman changing directions
    intersection_indx = intersect(find(abs(intersections.pos(:,1)-pacman.pos(1))<1),...
        find(abs(intersections.pos(:,2)-pacman.pos(2))<1));
    
    if ~isempty(intersection_indx)
        pacman.direction = choose_direction(pacman.direction,...
            find(intersections.direction(intersection_indx,:)),0,0,0,0);
    
        if pacman.direction==1
            set(semi_left_top,'facealpha',1)
            set(semi_right_top,'facealpha',1)
            set(semi_top_right,'facealpha',0)
            set(semi_bottom_right,'facealpha',0)
            set(semi_left_bottom,'facealpha',0)
            set(semi_right_bottom,'facealpha',0)
            set(semi_top_left,'facealpha',0)
            set(semi_bottom_left,'facealpha',0)
        elseif pacman.direction==2
            set(semi_left_top,'facealpha',0)
            set(semi_right_top,'facealpha',0)
            set(semi_top_right,'facealpha',1)
            set(semi_bottom_right,'facealpha',1)
            set(semi_left_bottom,'facealpha',0)
            set(semi_right_bottom,'facealpha',0)
            set(semi_top_left,'facealpha',0)
            set(semi_bottom_left,'facealpha',0)
        elseif pacman.direction==3
            set(semi_left_top,'facealpha',0)
            set(semi_right_top,'facealpha',0)
            set(semi_top_right,'facealpha',0)
            set(semi_bottom_right,'facealpha',0)
            set(semi_left_bottom,'facealpha',1)
            set(semi_right_bottom,'facealpha',1)
            set(semi_top_left,'facealpha',0)
            set(semi_bottom_left,'facealpha',0)
        elseif pacman.direction==4
            set(semi_left_top,'facealpha',0)
            set(semi_right_top,'facealpha',0)
            set(semi_top_right,'facealpha',0)
            set(semi_bottom_right,'facealpha',0)
            set(semi_left_bottom,'facealpha',0)
            set(semi_right_bottom,'facealpha',0)
            set(semi_top_left,'facealpha',1)
            set(semi_bottom_left,'facealpha',1)
        end
    end
    
    pause(1/180)
end