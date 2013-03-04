classdef Learner < handle
    properties
        preprocessor; %for preprocessing, preprocessor.run is the function handle
        
        %training variables (should be moved to Optimizer in the future)
        max_iter = 100;
        save_iter;
        save_dir;
    end
    
    methods
        function self = Learner()            
        end
        
        function [] = visualize1D(self, savepath, disp_col)
            if ~exist('savepath','var')
                savepath = './tmp';
            end
            clf;
            if ~exist('disp_col','var')            
                disp_col = round(sqrt(self.numunits));
            end
            disp_row = self.numunits / disp_col;
            for i = 1 : self.numunits
                subplot(disp_col,disp_row,i);
                plot(self.weights(:,i));
            end
            saveas(gcf,[savepath '.png']);
        end
        
        function X = fprop(self, X) %in current design train need to preprocess manually because other trainer (Optimizer) might envolve
            if ~isempty(self.preprocessor)
                X = self.preprocessor.run(self.preprocessor, X);     
            end
        end
        
        %-----to support batch update
        function [] = initialization(self, X)            
        end
        
        function [] = initIter(self,t)            
        end
        
        function [] = update(self, X)                                    
        end
        
        function [isstop] = checkStop(self)        
            isstop = false;
        end
        
        function [] = save(self)
        end
    end
end