function result = parseXMLAnnotation(filename)
annotationXML = xmlread(filename);
node = annotationXML.getChildNodes;
rootNode = node.item(0);  
childs = rootNode.getChildNodes;
nodeNum = childs.getLength();

result.armor = [];
result.base = [];
result.watcher = [];
result.car = [];

% Read annotation from given XML.
for index = 0:nodeNum-1
    mark = char(childs.item(index).getNodeName);
    if (strcmp(mark, 'size'))
        %[result.width, result.height] = [childs.item(index).getElementsByTagName('width'),childs.item(index).getElementsByTagName('height')];
        offsprings=childs.item(index).getChildNodes;
        result.width=str2num(offsprings.getElementsByTagName('width').item(0).getTextContent);
        result.height=str2num(offsprings.getElementsByTagName('height').item(0).getTextContent);
    elseif (strcmp(mark, 'object'))
        offsprings=childs.item(index).getChildNodes;
        bndbox = offsprings.getElementsByTagName('bndbox').item(0).getChildNodes;
        bnd_xmin=bndbox.getElementsByTagName('xmin').item(0).getTextContent;
        bnd_ymin=bndbox.getElementsByTagName('ymin').item(0).getTextContent;
        bnd_xmax=bndbox.getElementsByTagName('xmax').item(0).getTextContent;
        bnd_ymax=bndbox.getElementsByTagName('ymax').item(0).getTextContent;
        bndbox = [str2double(bnd_xmin), str2double(bnd_ymin), str2double(bnd_xmax), str2double(bnd_ymax)];
        if (strcmp(offsprings.getElementsByTagName('name').item(0).getTextContent(),'armor'))
           armor = struct;
           armor.class = str2num(offsprings.getElementsByTagName('armor_class').item(0).getTextContent);
           armor.color = char(offsprings.getElementsByTagName('armor_color').item(0).getTextContent);
           armor.bndbox = bndbox;
           result.armor = [result.armor, armor];
        elseif(strcmp(offsprings.getElementsByTagName('name').item(0).getTextContent(),'car'))
           car = struct;
           car.difficulty = str2num(offsprings.getElementsByTagName('difficulty').item(0).getTextContent);
           car.bndbox = bndbox;
           result.car = [result.car,car];
        elseif(strcmp(offsprings.getElementsByTagName('name').item(0),'watcher'))
           watcher = struct;
           watcher.difficulty = str2num(offsprings.getElementsByTagName('difficulty').item(0).getTextContent);           
           watcher.bndbox = bndbox;
           result.watcher = [result.watcher, watcher];
        elseif(strcmp(offsprings.getElementsByTagName('name').item(0),'base'))      
           base = struct;
           base.difficulty = str2num(offsprings.getElementsByTagName('difficulty').item(0).getTextContent);
           base.bndbox = bndbox;      
           result.base = [result.base, base];
        end    
    end
end



