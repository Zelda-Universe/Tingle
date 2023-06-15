class UpdateFkActions < ActiveRecord::Migration[7.0]
  def up
    # Map
    begin
      execute <<-SQL
        ALTER TABLE `map`
        DROP FOREIGN KEY `fk_map_project1`
      SQL
      execute <<-SQL
        ALTER TABLE `map`
        ADD CONSTRAINT `fk_map_project1`
        FOREIGN KEY (`container_id`)
        REFERENCES `container` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end

    # Marker
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_map_marker_map_marker_category1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_map_marker_map_marker_category1`
        FOREIGN KEY (`marker_category_id`)
        REFERENCES `marker_category` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_map_marker_map_marker_status1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_map_marker_map_marker_status1`
        FOREIGN KEY (`marker_status_id`)
        REFERENCES `marker_status` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_marker_submap1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_marker_submap1`
        FOREIGN KEY (`submap_id`)
        REFERENCES `submap` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 4
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_marker_submap2`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_marker_submap2`
        FOREIGN KEY (`overlay_id`)
        REFERENCES `submap` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end

    # Marker Category
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_map_container1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_map_container1`
        FOREIGN KEY (`container_id`)
        REFERENCES `container` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_marker_category1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_marker_category1`
        FOREIGN KEY (`parent_id`)
        REFERENCES `marker_category` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_marker_category_type1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_marker_category_type1`
        FOREIGN KEY (`marker_category_type_id`)
        REFERENCES `marker_category_type` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end

    # Marker Tab
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker_tab`
        DROP FOREIGN KEY `fk_marker_tab_marker_tab_status1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_tab`
        ADD CONSTRAINT `fk_marker_tab_marker_tab_status1`
        FOREIGN KEY (`marker_tab_status_id`)
        REFERENCES `marker_tab_status` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker_tab`
        DROP FOREIGN KEY `fk_marker_tab_user1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_tab`
        ADD CONSTRAINT `fk_marker_tab_user1`
        FOREIGN KEY (`user_id`)
        REFERENCES `user` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end

    # Submap
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_map_game_map_type10`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_map_game_map_type10`
        FOREIGN KEY (`map_type_id`)
        REFERENCES `map_type` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_map_mapper10`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_map_mapper10`
        FOREIGN KEY (`mapper_id`)
        REFERENCES `mapper` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_submap_map1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_submap_map1`
        FOREIGN KEY (`map_id`)
        REFERENCES `map` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end

    # Submap Layer
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `submap_layer`
        DROP FOREIGN KEY `fk_map_layer_submap1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap_layer`
        ADD CONSTRAINT `fk_map_layer_submap1`
        FOREIGN KEY (`submap_id`)
        REFERENCES `submap` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `submap_layer`
        DROP FOREIGN KEY `fk_submap_layer_mapper1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap_layer`
        ADD CONSTRAINT `fk_submap_layer_mapper1`
        FOREIGN KEY (`mapper_id`)
        REFERENCES `mapper` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
      SQL
    end
  end

  def down
    # Map
    begin
      execute <<-SQL
        ALTER TABLE `map`
        DROP FOREIGN KEY `fk_map_project1`
      SQL

      execute <<-SQL
        ALTER TABLE `map`
        ADD CONSTRAINT `fk_map_project1`
        FOREIGN KEY (`container_id`)
        REFERENCES `container` (`id`)
      SQL
    end

    # Marker
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_map_marker_map_marker_category1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_map_marker_map_marker_category1`
        FOREIGN KEY (`marker_category_id`)
        REFERENCES `marker_category` (`id`)
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_map_marker_map_marker_status1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_map_marker_map_marker_status1`
        FOREIGN KEY (`marker_status_id`)
        REFERENCES `marker_status` (`id`)
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_marker_submap1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_marker_submap1`
        FOREIGN KEY (`submap_id`)
        REFERENCES `submap` (`id`)
      SQL

      # 4
      execute <<-SQL
        ALTER TABLE `marker`
        DROP FOREIGN KEY `fk_marker_submap2`
      SQL
      execute <<-SQL
        ALTER TABLE `marker`
        ADD CONSTRAINT `fk_marker_submap2`
        FOREIGN KEY (`overlay_id`)
        REFERENCES `submap` (`id`)
      SQL
    end

    # Marker Category
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_map_container1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_map_container1`
        FOREIGN KEY (`container_id`)
        REFERENCES `container` (`id`)
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_marker_category1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_marker_category1`
        FOREIGN KEY (`parent_id`)
        REFERENCES `marker_category` (`id`)
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `marker_category`
        DROP FOREIGN KEY `fk_marker_category_marker_category_type1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_category`
        ADD CONSTRAINT `fk_marker_category_marker_category_type1`
        FOREIGN KEY (`marker_category_type_id`)
        REFERENCES `marker_category_type` (`id`)
      SQL
    end

    # Marker Tab
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `marker_tab`
        DROP FOREIGN KEY `fk_marker_tab_marker_tab_status1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_tab`
        ADD CONSTRAINT `fk_marker_tab_marker_tab_status1`
        FOREIGN KEY (`marker_tab_status_id`)
        REFERENCES `marker_tab_status` (`id`)
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `marker_tab`
        DROP FOREIGN KEY `fk_marker_tab_user1`
      SQL
      execute <<-SQL
        ALTER TABLE `marker_tab`
        ADD CONSTRAINT `fk_marker_tab_user1`
        FOREIGN KEY (`user_id`)
        REFERENCES `user` (`id`)
      SQL
    end

    # Submap
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_map_game_map_type10`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_map_game_map_type10`
        FOREIGN KEY (`map_type_id`)
        REFERENCES `map_type` (`id`)
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_map_mapper10`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_map_mapper10`
        FOREIGN KEY (`mapper_id`)
        REFERENCES `mapper` (`id`)
      SQL

      # 3
      execute <<-SQL
        ALTER TABLE `submap`
        DROP FOREIGN KEY `fk_submap_map1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap`
        ADD CONSTRAINT `fk_submap_map1`
        FOREIGN KEY (`map_id`)
        REFERENCES `map` (`id`)
      SQL
    end

    # Submap Layer
    begin
      # 1
      execute <<-SQL
        ALTER TABLE `submap_layer`
        DROP FOREIGN KEY `fk_map_layer_submap1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap_layer`
        ADD CONSTRAINT `fk_map_layer_submap1`
        FOREIGN KEY (`submap_id`)
        REFERENCES `submap` (`id`)
      SQL

      # 2
      execute <<-SQL
        ALTER TABLE `submap_layer`
        DROP FOREIGN KEY `fk_submap_layer_mapper1`
      SQL
      execute <<-SQL
        ALTER TABLE `submap_layer`
        ADD CONSTRAINT `fk_submap_layer_mapper1`
        FOREIGN KEY (`mapper_id`)
        REFERENCES `mapper` (`id`)
      SQL
    end
  end
end
