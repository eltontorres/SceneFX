require("scene.lua");
require("utils.lua");
require("gui.lua");
require("ndb.lua");

SceneLib.registerPlugin(
    function(scene, attachment)
        if scene.isGM then
            local node = scene.userData;
            local form = GUI.newForm("frmMain");
            local cbxAtivarClouds = GUI.findControlByName("cbxAtivarClouds", form);
            local btn_save = GUI.findControlByName("btn_save", form);
            node.idInterval = nil;
            local clouds = {};

            local assets = {
                "http://blob.firecast.com.br/blobs/ESKWPCLC_2516072/smoke1.png",
                "http://blob.firecast.com.br/blobs/ANSVKWHW_2516075/smoke2.png",
                "http://blob.firecast.com.br/blobs/OKRVWRDA_2516074/smoke3.png",
                "http://blob.firecast.com.br/blobs/JCRHBVQP_2516078/smoke4.png"
            };


            local function createClouds(qtd, tamanho, cor)
                for i = 1, qtd, 1 do
                    clouds[i] = scene.items:addToken("objects");
                    clouds[i].name = "cloud-effect";
                    clouds[i]:setCenter(math.random(0, round(scene.worldWidth)), math.random(0, round(scene.worldHeight)));
                    clouds[i].height = scene.grid.cellSize * tamanho;
                    clouds[i].width = scene.grid.cellSize * tamanho;
                    clouds[i].image.url = assets[i] or assets[(i % 5) + 1];
                    clouds[i].image.colorBlend = cor;
                end
            end

            local function loadClouds(items)
                for i = 1, #items, 1 do
                    if items[i].name == "cloud-effect" then
                        clouds[#clouds + 1] = items[i];
                    end
                end
            end

            local function deleteClouds(items)
                loadClouds(items);
                for i = 1, #clouds, 1 do
                    clouds[i]:delete();
                end
                clouds = {}
            end

            local function moveClouds()
                local velocidade = (node.velocidade * 0.01) / 5;
                for i = 1, #clouds, 1 do
                    if node.direcao == "Direita" then
                        if clouds[i].x > scene.worldWidth then
                            local x = 0 - scene.grid.cellSize * 5;
                            local y = math.random(0, round(scene.worldHeight));
                            clouds[i]:setCenter(x, y);
                        else
                            clouds[i].x = clouds[i].x + (scene.grid.cellSize * velocidade);
                        end
                    elseif node.direcao == "Fundo" then
                        if clouds[i].y > scene.worldHeight then
                            local y = 0 - scene.grid.cellSize * 5;
                            local x = math.random(0, round(scene.worldWidth));
                            clouds[i]:setCenter(x, y);
                        else
                            clouds[i].y = clouds[i].y + (scene.grid.cellSize * velocidade);
                        end
                    end
                end
            end

            if form ~= nil then
                form:setNodeObject(node);
            end

            if node ~= nil then
                if not node.quantidade then
                    node.quantidade = "4";
                end

                if not node.velocidade then
                    node.velocidade = "5";
                end

                if not node.direcao then
                    node.direcao = "0";
                end

                if not node.tamanho then
                    node.tamanho = "4";
                end
            end

            scene.viewport:setupToolCategory("scenefx", "SceneFX", 0);
            scene.viewport:addToolButton("scenefx", "SceneFX", "/icon.png", 0, { selectable = false },
                function()
                    if form == nil then
                        showMessage("nil");
                    else
                        form:show();
                    end

                end)

            if cbxAtivarClouds.checked == true then
                loadClouds(scene.items);
                node.idInterval = setInterval(function()
                    if scene.isObjectAlive == true then
                        moveClouds();
                    else
                        --showMessage("saiu!");
                        clearInterval(node.idInterval);
                        node.idInterval = nil;
                    end
                end, 16)
            end

            btn_save.onClick = function()
                if cbxAtivarClouds.checked == true then
                    deleteClouds(scene.items);
                    createClouds(node.quantidade, node.tamanho, node.colorCloud);

                    if node.idInterval == nil then
                        node.idInterval = setInterval(function()
                            if scene.isObjectAlive == true then
                                moveClouds();
                            else
                                -- showMessage("saiu!");
                                clearInterval(node.idInterval);
                                node.idInterval = nil;
                            end
                        end, 16)
                    end
                else
                    clearInterval(node.idInterval);
                    node.idInterval = nil;
                    deleteClouds(scene.items);
                end
            end
        end
    end);
