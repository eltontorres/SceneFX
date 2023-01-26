require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmMain");
    obj:setWidth(250);
    obj:setHeight(320);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setTitle("SceneFX");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setHorzAlign("justify");
    obj.flowLayout1:setMargins({left=20, top=20, bottom=20, right=20});
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(150);
    obj.flowPart1:setMaxWidth(230);
    obj.flowPart1:setHeight(25);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=5, right=5, top=5, bottom=5});

    obj.cbxAtivarClouds = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxAtivarClouds:setParent(obj.flowPart1);
    obj.cbxAtivarClouds:setName("cbxAtivarClouds");
    obj.cbxAtivarClouds:setAlign("client");
    obj.cbxAtivarClouds:setText("Ativar");
    obj.cbxAtivarClouds:setField("checkClouds");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(150);
    obj.flowPart2:setMaxWidth(250);
    obj.flowPart2:setHeight(25);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=5, right=5, top=5, bottom=5});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart2);
    obj.label1:setAlign("left");
    obj.label1:setText("Quantitade [4, 8]");
    obj.label1:setName("label1");
    obj.label1:setWidth(120);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setMargins({right=5});

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart2);
    obj.edit1:setAlign("left");
    obj.edit1:setField("quantidade");
    obj.edit1:setText("4");
    obj.edit1:setReadOnly(false);
    obj.edit1:setType("number");
    obj.edit1:setMin(4);
    obj.edit1:setMax(8);
    obj.edit1:setName("edit1");
    obj.edit1:setWidth(60);
    obj.edit1:setHorzTextAlign("center");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(150);
    obj.flowPart3:setMaxWidth(250);
    obj.flowPart3:setHeight(25);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=5, right=5, top=5, bottom=5});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart3);
    obj.label2:setAlign("left");
    obj.label2:setText("Velocidade [1, 10]");
    obj.label2:setName("label2");
    obj.label2:setWidth(120);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setMargins({right=5});

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart3);
    obj.edit2:setAlign("left");
    obj.edit2:setField("velocidade");
    obj.edit2:setText("5");
    obj.edit2:setReadOnly(false);
    obj.edit2:setType("number");
    obj.edit2:setMin(1);
    obj.edit2:setMax(10);
    obj.edit2:setName("edit2");
    obj.edit2:setWidth(60);
    obj.edit2:setHorzTextAlign("center");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(150);
    obj.flowPart4:setMaxWidth(250);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=5, right=5, top=5, bottom=5});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart4);
    obj.label3:setAlign("left");
    obj.label3:setText("Tamanho [1, 10]");
    obj.label3:setName("label3");
    obj.label3:setWidth(120);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setMargins({right=5});

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart4);
    obj.edit3:setAlign("left");
    obj.edit3:setField("tamanho");
    obj.edit3:setText("3");
    obj.edit3:setReadOnly(false);
    obj.edit3:setType("number");
    obj.edit3:setMin(1);
    obj.edit3:setMax(10);
    obj.edit3:setName("edit3");
    obj.edit3:setWidth(60);
    obj.edit3:setHorzTextAlign("center");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(150);
    obj.flowPart5:setMaxWidth(230);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=5, right=5, top=5, bottom=5});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart5);
    obj.label4:setAlign("left");
    obj.label4:setText("Direção");
    obj.label4:setName("label4");
    obj.label4:setWidth(120);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setMargins({right=5});

    obj.cbx_direcao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cbx_direcao:setParent(obj.flowPart5);
    obj.cbx_direcao:setName("cbx_direcao");
    obj.cbx_direcao:setAlign("client");
    obj.cbx_direcao:setWidth(100);
    obj.cbx_direcao:setField("direcao");
    obj.cbx_direcao:setItems({'Direita', 'Fundo'});
    obj.cbx_direcao:setText("Direita");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(150);
    obj.flowPart6:setMaxWidth(230);
    obj.flowPart6:setHeight(25);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=5, right=5, top=5, bottom=5});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart6);
    obj.label5:setAlign("left");
    obj.label5:setText("Cor");
    obj.label5:setName("label5");
    obj.label5:setWidth(120);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setMargins({right=5});

    obj.cbx_color = GUI.fromHandle(_obj_newObject("colorComboBox"));
    obj.cbx_color:setParent(obj.flowPart6);
    obj.cbx_color:setName("cbx_color");
    obj.cbx_color:setAlign("client");
    obj.cbx_color:setWidth(100);
    obj.cbx_color:setField("colorCloud");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(150);
    obj.flowPart7:setMaxWidth(230);
    obj.flowPart7:setHeight(25);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=5, right=5, top=5, bottom=5});

    obj.btn_save = GUI.fromHandle(_obj_newObject("button"));
    obj.btn_save:setParent(obj.flowPart7);
    obj.btn_save:setName("btn_save");
    obj.btn_save:setAlign("client");
    obj.btn_save:setText("Aplicar mudanças");
    obj.btn_save:setWidth(120);

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.cbxAtivarClouds ~= nil then self.cbxAtivarClouds:destroy(); self.cbxAtivarClouds = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.btn_save ~= nil then self.btn_save:destroy(); self.btn_save = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.cbx_color ~= nil then self.cbx_color:destroy(); self.cbx_color = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.cbx_direcao ~= nil then self.cbx_direcao:destroy(); self.cbx_direcao = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "SceneFX", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);

return _frmMain;
