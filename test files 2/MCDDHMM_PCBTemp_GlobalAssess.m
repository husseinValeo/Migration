%% Viewing the template methods ucosg the MATLAB "Help On Selection" is more powerful, so please try it to get the best practices.
%
%% Guidance Notes
%
% 1- Don't change the functions accessibility(public, private, static, ...).
%
% 2- Don't change the functions names(AssesSignals and AssessmentDescription).
%
% 3- Don't remove any returned objects(status, assessment)
%
%
% ** PLEASE MAKE SURE THAT YOUR .M FILE NAME IS THE SAME NAME IN THE "classdef" AS IT MAY INTRODUCE ISSUES.
%
% ** IN SENTINEL GUI YOU CAN ASSIGN YOUR GLOBAL ASSESSMENT TO A NUMBER OF TEST-SHEETS 
%    BY CREATING HARNESS THEN SELECT ANY TEST-SHEET NODE A LIST OF YOUR GLOBAL ASSESSMENTS 
%    FINALLY, SELECT THE GLOBAL ASSESSMENTS YOU NEED **
%
% ---------------------------------------------------------------------------------
% How to assess your different kinds of signals such as: array, struct and so on.
% ---------------------------------------------------------------------------------
%
% INSIDE THE FUNCTION "AssesSignals(signals, signals_AllValues)" YOU CAN USE THE "signals" ARGUMENT AS THE FOLLOWING TO ACCESS YOUR SIGNALS
% "signals_AllValues" is used to access all values of signals across all
% sample times (access old signal values)
%
%    1- Current triggered sample-time for this global assessment.
%       signals('sample_time') % Note: 'sample_time' IS CASE SENESTIVE DO NOT CHANGE IT.
%
%
%    2- Traditional Signal:
%       signals('Out2')         % To get a traditional signals, just write its name directly.
%
%
%    3- Array Signal:
%       signals('Arr1(1)')      % You can access index #2 such as signals('Arr1(2)') and so on.
%
%
%    4- Struct Signal:
%       signals('Out3.BB2')     % For accessing more deeping levels e.g. for accessing struct 'CC1' under the 'BB2' it will be such as.
%
%
%    5- Struct Of Array Signal:
%       signals('B.BB4.CC1(1)') % You can access index #2 such as signals('B.BB4.CC1(2)') and so on.        
%
%
%    6- Array Of Struct Signal:
%       signals('B.BB4(1).CC1') % You can access index #2 such as signals('B.BB4(2).CC1') and so on.        
%
%    7- Enum Signal:
%       signals('B.ROOT')       % You can access another enum element such as signals('B.LEVEL') and so on.        
%
%
%%   See also AssesSignals, AssessmentDescription

classdef MCDDHMM_PCBTemp_GlobalAssess   
    
    methods(Access = public, Static)
        function[ status ] = AssesSignals(signals, signals_AllValues, currentWorkingScenarioInfo)
            % Signals
            current_sample_time_val     = signals('sample_time');
            MCDDHMM_pm_temp1_cntr_wrt   = signals('pm_temp1_cntr_wrt');
            MCDDHMM_pm_temp2_cntr_wrt   = signals('pm_temp2_cntr_wrt');
            MCDDHMM_pm_temp3_cntr_wrt   = signals('pm_temp3_cntr_wrt');
            MCDDHMM_pm_temp4_cntr_wrt   = signals('pm_temp4_cntr_wrt');

            if(current_sample_time_val>=1 && current_sample_time_val<=2)
                if(MCDDHMM_pm_temp1_cntr_wrt==0 && MCDDHMM_pm_temp2_cntr_wrt==0 && MCDDHMM_pm_temp3_cntr_wrt==0 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==3)
                if(MCDDHMM_pm_temp1_cntr_wrt==1 && MCDDHMM_pm_temp2_cntr_wrt==0 && MCDDHMM_pm_temp3_cntr_wrt==0 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==4)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==0 && MCDDHMM_pm_temp3_cntr_wrt==0 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==5)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==1 && MCDDHMM_pm_temp3_cntr_wrt==0 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==6)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==0 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==7)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==1 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==8)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==2 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==9)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==0)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==10)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==1)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==11)                
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==2)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==12)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==2 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==2)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end      
            elseif(current_sample_time_val==13)
                if(MCDDHMM_pm_temp1_cntr_wrt==2 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==2)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end      
            elseif(current_sample_time_val==14)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==3 && MCDDHMM_pm_temp4_cntr_wrt==2)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end     
            elseif(current_sample_time_val==15)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==2)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end     
            elseif(current_sample_time_val==16)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==3)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==17)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==4)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==18)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==5)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==19)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==6)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            elseif(current_sample_time_val==20)
                if(MCDDHMM_pm_temp1_cntr_wrt==3 && MCDDHMM_pm_temp2_cntr_wrt==3 && MCDDHMM_pm_temp3_cntr_wrt==4 && MCDDHMM_pm_temp4_cntr_wrt==7)
                    status = AssessmentStatus.PASSED;
                else
                    status = AssessmentStatus.FAILED;
                end
            else
                status = AssessmentStatus.FAILED;
            end
            %% Function Description Section.
            function [ assessment ] = AssessmentDescription()
                %% Function Help
                %
                % This function is the responsible for showing your defined assessments desription in GEEDS Testscript > Assessments Sheet
                % This function is optional for implementing, just write what you know to help others to know what you have done and how to use it in the future.
                
                assessment.name                = 'MCDDHMM_PCBTemp global assessment';
                assessment.prototype           = 'MCDDHMM_PCBTemp_GlobalAssess([status],[assessment])';
                assessment.description         = 'assess the HMM MCU Spent Time Counter';             
                assessment.ReqIDs              = 'INV_ETECH_SCD_MCDD_1061#02, INV_ETECH_SCD_MCDD_1161#02';
                assessment.Scope               = 'global';
                assessment.PassedMessage       = 'Message to show in case of the global assessments is passed'; %not supported yet 
                assessment.FailedMessage       = 'Message to show in case of the global assessments is failed'; %not supported yet
                assessment.NotTriggeredMessage = 'Message to show in case of the global assessments is not triggered'; %not supported yet
                assessment.limitations         = 'No limitations';
                assessment.owner               = 'mosama';
                assessment.supportedVersion    = '5.2.0';
                assessment.SignalsToReport 	   = {'MCDDHMM_pm_temp1_cntr_wrt, MCDDHMM_pm_temp2_cntr_wrt, MCDDHMM_pm_temp3_cntr_wrt, MCDDHMM_pm_temp4_cntr_wrt'}; %for testing
            %	assessment.TimeTolerance	   = 0.01;            
        end
    end
end